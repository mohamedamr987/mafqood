import 'package:firebase_auth/firebase_auth.dart';

class LoggedUserModel{
  String fullName;
  FirebaseAuth auth = FirebaseAuth.instance;
  String get email{
    return auth.currentUser!.email!;
  }
  LoggedUserModel({required this.fullName});
}