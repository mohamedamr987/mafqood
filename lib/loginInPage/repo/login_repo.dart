import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mafqood/core/errors/exceptions.dart';
import 'package:mafqood/core/errors/failures.dart';
import 'package:mafqood/core/repo/repo.dart';

class LoginRepo extends Repository {
  FirebaseAuth? firebaseAuth;
  LoginRepo({this.firebaseAuth});
  Future<Either<Failure, void>> login(String email, String password,) async {
    return await exceptionHandler(
      () async {
        try {
          final credential = await (firebaseAuth??FirebaseAuth.instance).signInWithEmailAndPassword(
              email: email,
              password: password
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            throw ServerException(exceptionMessage: 'No user found for that email.');
          } else if (e.code == 'wrong-password') {
            throw ServerException(exceptionMessage: 'Wrong password provided for that user.');
          }
        }
        return;
      },
    );
  }


}
