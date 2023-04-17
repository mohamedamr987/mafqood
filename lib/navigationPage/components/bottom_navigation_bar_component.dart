import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/navigationPage/controller.dart';
import 'package:mafqood/navigationPage/widgets/bottom_nav_bar_item_widget.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  const BottomNavigationBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationPageController blocController = NavigationPageController.of(context);
    return BlocBuilder(
      bloc: blocController,
      builder: (context, state){
        return BottomNavigationBar(
          currentIndex: blocController.index,
          onTap: blocController.changeIndex,
          backgroundColor: kPrimaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.75),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          items: [
            bottomNavigationBarItemWidget(
              label: "Home",
              icon: Icons.home,
            ),
            bottomNavigationBarItemWidget(
              label: "Chat",
              icon: Icons.chat,
            ),
            bottomNavigationBarItemWidget(
              label: "Report",
              icon: Icons.camera_alt,
            ),
            bottomNavigationBarItemWidget(
              label: "Settings",
              icon: Icons.person,
            ),
          ],
        );
      },
    );
  }
}
