import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/core/models/category_model.dart';
import 'package:mafqood/widgets/snack_bar_shower.dart';

import '../core/models/report_model.dart';
import 'repo/all_reports_repo.dart';
import 'state.dart';

class AllReportsPageController extends Cubit<AllReportsPageState>
{
  AllReportsPageController(this.categoryModel, this.name,) :super(AllReportsPageInit());
  static AllReportsPageController of(context)=> BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  final AllReportsRepo homeRepo = AllReportsRepo();
  List<ReportModel> recentReports = [];
  CategoryModel? categoryModel;
  String? name;

  void init() async {
    emit(AllReportsPageLoading());
    if (name != null) {
      final result = await homeRepo.searchReports(name!);
      result.fold(
        (l) => emit(AllReportsPageError()),
        (r) {
          recentReports = r;
          emit(AllReportsPageDone());
        },
      );
    } else {
      final result = await homeRepo.getReportsByCategory(categoryModel!);
      result.fold(
        (l) => emit(AllReportsPageError()),
        (r) {
          recentReports = r;
          emit(AllReportsPageDone());
        },
      );
    }
  }
}