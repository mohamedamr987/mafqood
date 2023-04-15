import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/navigationPage/controller.dart';

import 'bottom_navigation_bar_component.dart';

class NavigationPageScaffold extends StatelessWidget {
  const NavigationPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationPageController blocController = NavigationPageController.of(context);
    return Scaffold(
      body: BlocBuilder(
        bloc: blocController,
        builder: (context, state) {
          return IndexedStack(
            index: blocController.index,
            children: blocController.children,
          );
        },
      ),
      bottomNavigationBar: const BottomNavigationBarComponent(),
    );
  }
}
