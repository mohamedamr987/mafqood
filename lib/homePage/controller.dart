import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/core/models/category_model.dart';
import 'package:mafqood/widgets/snack_bar_shower.dart';

import '../core/models/report_model.dart';
import 'repo/home_repo.dart';
import 'state.dart';

class HomePageController extends Cubit<HomePageState>
{
  HomePageController() :super(HomePageInit());
  static HomePageController of(context)=> BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  final HomeRepo homeRepo = HomeRepo();
  List<ReportModel> recentReports = [];

  void init() async {
    emit(HomePageLoading());
    try {
      await getReports();
      emit(HomePageDone());
    } catch (e) {
      emit(HomePageError());
    }
  }

  Future<void> getReports() async {
    final result = await homeRepo.getRecentReports();
    result.fold(
          (l) => throw Exception(l.message ?? kErrorText),
          (r) {
        recentReports = r;

      },
    );
  }
}