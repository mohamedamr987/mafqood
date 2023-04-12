import 'package:hive/hive.dart';

class BearerTokenRepo{
  String? getBearerToken() {
    return Hive.box('user').get('bearerToken');
  }

  Future<void> setBearerToken(String token) async {
    Hive.box("user").put('bearerToken', token);
  }

  Future<void> deleteBearerToken() async {
    Hive.box("user").delete('bearerToken');
  }
}