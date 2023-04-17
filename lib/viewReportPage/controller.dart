import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class ViewReportPageController extends Cubit<ViewReportPageState>
{
  ViewReportPageController() :super(ViewReportPageInit());
  static ViewReportPageController of(context)=> BlocProvider.of(context);
}