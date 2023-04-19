import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mafqood/core/errors/exceptions.dart';
import 'package:mafqood/core/errors/failures.dart';
import 'package:mafqood/core/repo/repo.dart';

class SignUpRepo extends Repository {
  FirebaseFirestore db = FirebaseFirestore.instance;
  Future<Either<Failure, void>> signUp(String email, String password, String fullName) async {
    return await exceptionHandler(
      () async {
        try {
          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          await createUserData(fullName);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            throw ServerException(exceptionMessage: 'The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            throw ServerException(exceptionMessage: 'The account already exists for that email.');
          }
        }
      },
    );
  }

  Future<void> createUserData(String fullName) async {
    await FirebaseAuth.instance.currentUser!.updateDisplayName(fullName);
    await db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'fullName': fullName,
      'email': FirebaseAuth.instance.currentUser!.email,
      'uid': FirebaseAuth.instance.currentUser!.uid,
    });
  }
}
