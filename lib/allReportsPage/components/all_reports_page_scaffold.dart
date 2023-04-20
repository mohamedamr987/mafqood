import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/widgets/bloc_temp_widget.dart';
import 'package:mafqood/widgets/general_app_bar_widget.dart';
import 'package:mafqood/widgets/wrap_of_reports_widget.dart';

import '../../widgets/main_layout_widget.dart';
import '../controller.dart';
import '../state.dart';

class AllReportsPageScaffold extends StatelessWidget {
  const AllReportsPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllReportsPageController blocController = AllReportsPageController.of(context);
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      backGroundColor: Colors.white,
      widthMargin: 0,
      appBar: generalAppBar(title: blocController.name ?? blocController.categoryModel!.name),
      widget: BlocBuilder(
        bloc: blocController,
        builder: (context, state){
          return BlocTempWidget(
            successWidget: Column(
              children: [
                const SizedBox(width: double.infinity,),
                WrapOfReportsWidget(reports: blocController.recentReports,),
              ],
            ),
            errorState: state is AllReportsPageError,
            loadingState: state is AllReportsPageLoading,
          );
        },
      )
    );
  }
}
