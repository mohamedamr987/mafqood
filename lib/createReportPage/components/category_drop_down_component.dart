import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';

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
            child: DropdownButton<String>(
              value: blocController.createReportModel.category,
              isExpanded: true,
              hint: const Text('Select Category'),
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.grey.shade700),
              underline: const SizedBox(),
              onChanged: (String? newValue) {
                setState(() {
                  blocController.createReportModel.category = newValue!;
                });
              },
              items: <String>["Humans", "Animals", "Bags", "Cars", "Phones"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          )
        ],
      )
    );
  }
}



