import 'package:dartz/dartz.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/core/errors/failures.dart';
import 'package:mafqood/core/repo/repo.dart';

class LoginRepo extends Repository {

  Future<Either<Failure, void>> login(String emailOrUsername, String password,) async {
    return await exceptionHandler(
      () async {
        Map<String, dynamic> result = await dioHelper.postDataWithoutToken("user/login", {
          'email': emailOrUsername,
          'password' : password,
        });
        // await CoreInfo.handleAuthJson(result['data']);
        return;
      },
    );
  }


}
