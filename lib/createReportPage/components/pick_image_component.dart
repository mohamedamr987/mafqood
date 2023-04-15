import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/createReportPage/controller.dart';

import '../state.dart';

class PickImageComponent extends StatelessWidget {
  const PickImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateReportPageController blocController =
        CreateReportPageController.of(context);
    return InkWell(
      onTap: blocController.pickImage,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kPrimaryColor),
        ),
        child: BlocBuilder(
          buildWhen: (previous, current) =>
              current is CreateReportPagePickImage,
          bloc: blocController,
          builder: (context, state) {
            if (blocController.createReportModel.pickedImage != null) {
              return Image.file(
                File(blocController.createReportModel.pickedImage!.path),
                fit: BoxFit.contain,
              );
            } else {
              return const Center(
                child: Icon(
                  Icons.camera_alt,
                  color: kPrimaryColor,
                  size: 42,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
