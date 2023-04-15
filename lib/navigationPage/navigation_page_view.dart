import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/navigation_page_scaffold.dart';
import 'controller.dart';

class NavigationPageView extends StatelessWidget {
  const NavigationPageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationPageController(),
      child: const NavigationPageScaffold(),
    );
  }
}
