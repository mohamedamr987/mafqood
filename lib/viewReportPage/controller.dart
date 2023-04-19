import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/core/models/report_model.dart';
import 'package:mafqood/main.dart';
import 'package:mafqood/navigationPage/navigation_page_view.dart';
import 'package:mafqood/viewReportPage/repo/view_report_repo.dart';
import 'package:mafqood/widgets/show_loading.dart';
import 'package:mafqood/widgets/snack_bar_shower.dart';

import 'state.dart';

class ViewReportPageController extends Cubit<ViewReportPageState>
{
  ViewReportPageController(this.reportModel) :super(ViewReportPageInit());
  static ViewReportPageController of(context)=> BlocProvider.of(context);
  final ReportModel reportModel;
  final ViewReportRepo _viewReportRepo = ViewReportRepo();
  void deleteReport() async{
    showLoading();
    final result = await _viewReportRepo.deleteReport(reportModel);
    hideLoading();
    result.fold(
      (l) => snackBarShower(l.message ?? kErrorText),
      (r) {
        NavigationHelper.push(navigatorKey.currentContext!, const NavigationPageView());
        snackBarShower("Your report has been deleted successfully");
      },
    );
  }
}