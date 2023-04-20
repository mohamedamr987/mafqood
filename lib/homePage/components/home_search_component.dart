import 'package:flutter/material.dart';
import 'package:mafqood/allReportsPage/all_reports_page_view.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/homePage/controller.dart';
import 'package:mafqood/widgets/general_text.dart';
class HomeSearchComponent extends StatefulWidget {
  const HomeSearchComponent({Key? key}) : super(key: key);

  @override
  State<HomeSearchComponent> createState() => _HomeSearchComponentState();
}

class _HomeSearchComponentState extends State<HomeSearchComponent> {

  @override
  Widget build(BuildContext context) {
    HomePageController blocController = HomePageController.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: blocController.searchController,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          hintText: "Search",
          hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.7),),
          prefixIcon: Icon(Icons.search, color: kPrimaryColor.withOpacity(0.7),),
          suffix: blocController.searchController.text.isNotEmpty ? GestureDetector(
            onTap: () {
              NavigationHelper.push(context, AllReportsPageView(name: blocController.searchController.text,),);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const GeneralText(text: "Search", color: kPrimaryColor,),
            ),
          ) : const SizedBox(),
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
