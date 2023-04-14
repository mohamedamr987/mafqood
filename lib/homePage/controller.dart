import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class HomePageController extends Cubit<HomePageState>
{
  HomePageController() :super(HomePageInit());
  static HomePageController of(context)=> BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
}