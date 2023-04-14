import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/homePage/controller.dart';

class HomeSearchComponent extends StatelessWidget {
  const HomeSearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController blocController = HomePageController.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
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
      ),
    );
  }
}
