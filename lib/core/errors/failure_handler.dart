import 'package:dartz/dartz.dart';

import '../../constants.dart';
import '../../widgets/snack_bar_shower.dart';
import 'failures.dart';

void failureHandler(Either<Failure, dynamic> result, void Function() onSuccess){
  result.fold(
    (l) => snackBarShower( l.message??kErrorText),
    (r) => onSuccess(),
  );
}