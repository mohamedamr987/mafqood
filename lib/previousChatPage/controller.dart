import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/previousChatPage/repo/previous_chat_repo.dart';

import 'models/previous_chat_model.dart';
import 'state.dart';

class PreviousChatPageController extends Cubit<PreviousChatPageState>
{
  PreviousChatPageController() :super(PreviousChatPageInit());
  static PreviousChatPageController of(context)=> BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  final PreviousChatRepo previousChatRepo = PreviousChatRepo();
  List<PreviousChatModel> previousChatList = [];

  void getPreviousChatList() async {
    emit(PreviousChatPageLoading());
    var result = await previousChatRepo.getPreviousChatList();
    result.fold((l) => emit(PreviousChatPageError()), (r) {
      previousChatList = r;
      emit(PreviousChatPageDone());
    });
  }
}