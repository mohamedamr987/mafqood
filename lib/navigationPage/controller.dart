import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/createReportPage/create_report_page_view.dart';
import 'package:mafqood/settingsPage/settings_page_view.dart';

import '../homePage/home_page_view.dart';
import 'state.dart';

class NavigationPageController extends Cubit<NavigationPageState>
{
  NavigationPageController() :super(NavigationPageInit());
  static NavigationPageController of(context)=> BlocProvider.of(context);
  List<Widget> children = const [
    HomePageView(),
    Center(child: Text("Chat")),
    CreateReportPageView(),
    SettingsPageView(),
  ];
  int index = 0;

  void changeIndex(int newIndex)
  {
    index = newIndex;
    emit(NavigationPageInit());
  }
}