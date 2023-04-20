import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/core/models/category_model.dart';
import 'components/all_reports_page_scaffold.dart';
import 'controller.dart';

class AllReportsPageView extends StatelessWidget {
  final String? name;
  final CategoryModel? categoryModel;
  const AllReportsPageView({Key? key, this.name, this.categoryModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllReportsPageController(categoryModel, name)..init(),
      child: const AllReportsPageScaffold(),
    );
  }
}
