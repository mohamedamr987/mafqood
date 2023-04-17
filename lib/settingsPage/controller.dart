import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class SettingsPageController extends Cubit<SettingsPageState>
{
  SettingsPageController() :super(SettingsPageInit());
  static SettingsPageController of(context)=> BlocProvider.of(context);
}