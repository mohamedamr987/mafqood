import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/core/errors/failures.dart';
import 'package:mafqood/core/models/category_model.dart';
import 'package:mafqood/core/models/report_model.dart';
import 'package:mafqood/core/repo/repo.dart';

class AllReportsRepo extends Repository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Either<Failure, List<ReportModel>>> getReportsByCategory(CategoryModel categoryModel) async {
    return await exceptionHandler<List<ReportModel>>(
          () async {
        List<ReportModel> reports = [];
        await firestore.collection('reports').where("category_id", isEqualTo: categoryModel.id).get().then((value) => value.docs.forEach((element) {
          reports.add(ReportModel.fromJson(element.data(),element.id));
        }));
        return reports.reversed.toList();
      },
    );
  }

  Future<Either<Failure, List<ReportModel>>> searchReports(String name) async {
    return await exceptionHandler<List<ReportModel>>(
          () async {
        List<ReportModel> reports = [];
        await firestore.collection('reports').where("name", arrayContains: name).where("place", arrayContains: name).get().then((value) => value.docs.forEach((element) {
          reports.add(ReportModel.fromJson(element.data(),element.id));
        }));
        return reports.reversed.toList();
      },
    );
  }

}
