import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class PreviousChatPageController extends Cubit<PreviousChatPageState>
{
  PreviousChatPageController() :super(PreviousChatPageInit());
  static PreviousChatPageController of(context)=> BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
}