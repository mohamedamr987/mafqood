import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/homePage/components/categories_component.dart';
import 'package:mafqood/homePage/components/recently_component.dart';
import 'package:mafqood/homePage/controller.dart';
import 'package:mafqood/homePage/state.dart';
import 'package:mafqood/widgets/bloc_temp_widget.dart';

import '../../widgets/main_layout_widget.dart';
import 'home_search_component.dart';

class HomePageScaffold extends StatelessWidget {
  const HomePageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController blocController = HomePageController.of(context);
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      backGroundColor: Colors.white,
      widthMargin: 0,
      widget: BlocBuilder(
        bloc: blocController,
        builder: (context, state){
          return BlocTempWidget(
            successWidget: Column(
              children: [
                const SizedBox(width: double.infinity,),
                const SizedBox(height: 25,),
                SvgPicture.asset("assets/logo_with_text.svg", color: kPrimaryColor, width: 137,),
                const SizedBox(height: 40,),
                const HomeSearchComponent(),
                const SizedBox(height: 32,),
                const CategoriesComponent(),
                const RecentlyComponent()
              ],
            ),
            errorState: state is HomePageError,
            loadingState: state is HomePageLoading,
          );
        },
      )
    );
  }
}
