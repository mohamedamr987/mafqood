import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/core/models/category_model.dart';

import 'repo/home_repo.dart';
import 'state.dart';

class HomePageController extends Cubit<HomePageState>
{
  HomePageController() :super(HomePageInit());
  static HomePageController of(context)=> BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  final HomeRepo homeRepo = HomeRepo();

  void init() async {
    emit(HomePageLoading());
    try {

      emit(HomePageDone());
    } catch (e) {
      emit(HomePageError());
    }
  }

}