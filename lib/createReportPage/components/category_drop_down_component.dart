import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/core/models/category_model.dart';

import '../controller.dart';

class CategoryDropdownComponent extends StatefulWidget {
  const CategoryDropdownComponent({Key? key}) : super(key: key);

  @override
  State<CategoryDropdownComponent> createState() => _CategoryDropdownComponentState();
}

class _CategoryDropdownComponentState extends State<CategoryDropdownComponent> {
  @override
  Widget build(BuildContext context) {
    CreateReportPageController blocController = CreateReportPageController.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: kPrimaryColor),
      ),
      child: Row(
        children: [
          Icon(Icons.category, color: kPrimaryColor.withOpacity(0.5),),
          const SizedBox(width: 8,),
          Expanded(
            child: DropdownButton<CategoryModel>(
              value: blocController.createReportModel.category,
              isExpanded: true,
              hint: const Text('Select Category'),
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.grey.shade700),
              underline: const SizedBox(),
              onChanged: (CategoryModel? newValue) {
                setState(() {
                  blocController.createReportModel.category = newValue!;
                });
              },
              items: CoreInfo.categories
                  .map<DropdownMenuItem<CategoryModel>>((CategoryModel value) {
                return DropdownMenuItem<CategoryModel>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
          )
        ],
      )
    );
  }
}



