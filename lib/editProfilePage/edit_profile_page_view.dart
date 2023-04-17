import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/edit_profile_scaffold.dart';
import 'controller.dart';

class EditProfilePageView extends StatelessWidget {
  const EditProfilePageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfilePageController(),
      child: const EditProfilePageScaffold(),
    );
  }
}
