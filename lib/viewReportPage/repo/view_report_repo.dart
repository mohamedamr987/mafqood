import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/core/errors/failures.dart';
import 'package:mafqood/core/models/report_model.dart';
import 'package:mafqood/core/repo/repo.dart';

class ViewReportRepo extends Repository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<Either<Failure, void>> deleteReport(ReportModel reportModel) async {
    return await exceptionHandler(
      () async {
        await _firestore.collection("reports").doc(reportModel.docId).delete();
      },
    );
  }


}
