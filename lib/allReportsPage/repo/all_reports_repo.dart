import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
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
        reports = (await getReports()).where((element) => element.categoryId == categoryModel.id).toList();
        return reports;
      },
    );
  }

  Future<Either<Failure, List<ReportModel>>> searchReports(String name) async {
    name = name.toLowerCase();
    return await exceptionHandler<List<ReportModel>>(
          () async {
        List<ReportModel> reports = [];
        reports = (await getReports())
            .where((element) =>
                element.name.toLowerCase().contains(name) ||
                element.place.toLowerCase().contains(name) ||
                element.age.toLowerCase().contains(name))
            .toList();
        return reports;
      },
    );
  }

  Future<List<ReportModel>> getReports() async {
    List<ReportModel> reports = [];
    await firestore.collection('reports').get().then((value) => value.docs.forEach((element) {
      reports.add(ReportModel.fromJson(element.data(),element.id));
    }));
    return reports.reversed.toList();
  }

}
