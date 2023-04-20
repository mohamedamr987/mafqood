import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/models/report_model.dart';
import 'repo/home_repo.dart';
import 'state.dart';

class MyReportsPageController extends Cubit<MyReportsPageState>
{
  MyReportsPageController() :super(MyReportsPageInit());
  static MyReportsPageController of(context)=> BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  final MyReportsRepo homeRepo = MyReportsRepo();
  List<ReportModel> myReports = [];

  void getMyReports() async {
    emit(MyReportsPageLoading());
    final result = await homeRepo.getMyReports();
    result.fold(
      (l) => emit(MyReportsPageError()),
      (r) {
        myReports = r;
        emit(MyReportsPageDone());
      },
    );
  }
}