import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/widgets/bloc_temp_widget.dart';
import 'package:mafqood/widgets/general_app_bar_widget.dart';
import 'package:mafqood/widgets/wrap_of_reports_widget.dart';

import '../../widgets/main_layout_widget.dart';
import '../controller.dart';
import '../state.dart';

class MyReportsPageScaffold extends StatelessWidget {
  const MyReportsPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyReportsPageController blocController = MyReportsPageController.of(context);
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      backGroundColor: Colors.white,
      widthMargin: 0,
      appBar: generalAppBar(title: "My Reports", haveBackButton: false),
      widget: BlocBuilder(
        bloc: blocController,
        builder: (context, state){
          return BlocTempWidget(
            successWidget: Column(
              children: [
                const SizedBox(width: double.infinity,),
                WrapOfReportsWidget(reports: blocController.myReports,)
              ],
            ),
            errorState: state is MyReportsPageError,
            loadingState: state is MyReportsPageLoading,
          );
        },
      )
    );
  }
}
