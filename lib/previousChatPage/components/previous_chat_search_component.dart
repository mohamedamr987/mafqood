import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';

import '../controller.dart';

class PreviousChatSearchComponent extends StatelessWidget {
  const PreviousChatSearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreviousChatPageController blocController = PreviousChatPageController.of(context);
    return TextField(
      controller: blocController.searchController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        hintText: "Search",
        hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.7),),
        prefixIcon: Icon(Icons.search, color: kPrimaryColor.withOpacity(0.7),),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(color: kPrimaryColor,),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(color: kPrimaryColor,),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
