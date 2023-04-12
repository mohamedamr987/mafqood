import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../constants.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';
import '../helpers/dio_helper.dart';


abstract class Repository{
  
  final DioHelper dioHelper = DioHelper();

  Future<Either<Failure,ReturnType>> exceptionHandler<ReturnType> (Future<ReturnType> Function() function) async{
    try{
      return Right(await function());
    }
    catch(e, trace){
      log(e.toString());
      log(trace.toString());
      return Left(ServerFailure(message: (e is ServerException)? e.toString() : kErrorText),);
    }
  }
}