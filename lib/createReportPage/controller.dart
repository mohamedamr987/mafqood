import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/createReportPage/models/create_report_model.dart';
import 'package:mafqood/createReportPage/repo/create_report_repo.dart';
import 'package:mafqood/main.dart';
import 'package:mafqood/navigationPage/navigation_page_view.dart';
import 'package:mafqood/widgets/show_loading.dart';

import '../widgets/snack_bar_shower.dart';
import 'state.dart';

class CreateReportPageController extends Cubit<CreateReportPageState>
{
  CreateReportPageController() :super(CreateReportPageInit());
  static CreateReportPageController of(context)=> BlocProvider.of(context);
  final CreateReportRepo createReportRepo = CreateReportRepo();
  CreateReportModel createReportModel = CreateReportModel();

  void pickImage() async {
    await createReportModel.pickImage();
    emit(CreateReportPagePickImage());
  }

  void createReport() async {
    if(createReportModel.validate()){
      showLoading();
      final result = await createReportRepo.createReport(createReportModel);
      hideLoading();
      result.fold(
        (l) => snackBarShower(l.message ?? kErrorText),
        (r) {
          NavigationHelper.push(navigatorKey.currentContext!, const NavigationPageView());
          snackBarShower("Report created successfully");
        },
      );
    }
  }
}