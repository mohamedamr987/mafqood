import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mafqood/createReportPage/models/create_report_model.dart';

import 'state.dart';

class CreateReportPageController extends Cubit<CreateReportPageState>
{
  CreateReportPageController() :super(CreateReportPageInit());
  static CreateReportPageController of(context)=> BlocProvider.of(context);

  CreateReportModel createReportModel = CreateReportModel();

  void pickImage() async {
    await createReportModel.pickImage();
    emit(CreateReportPagePickImage());
  }
}