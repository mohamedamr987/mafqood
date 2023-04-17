import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/settings_page_scaffold.dart';
import 'controller.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsPageController(),
      child: const SettingsPageScaffold(),
    );
  }
}
