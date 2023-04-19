import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/core/errors/failures.dart';
import 'package:mafqood/core/models/category_model.dart';
import 'package:mafqood/core/repo/repo.dart';
import 'package:mafqood/createReportPage/models/create_report_model.dart';

class CreateReportRepo extends Repository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Either<Failure, void>> createReport(CreateReportModel createReportModel) async {
    return await exceptionHandler<void>(
      () async {
        await firestore.collection('reports').add( await createReportModel.toJson());
      },
    );
  }


}
