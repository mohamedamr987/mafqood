import 'package:flutter/material.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/homePage/controller.dart';
import 'package:mafqood/homePage/widgets/category_widget.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController blocController = HomePageController.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 20,),
      padding: const EdgeInsets.all(2,),
      height: 80,
      width: double.infinity,
      child: ListView.builder(
        itemCount: CoreInfo.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryWidget(categoryModel: CoreInfo.categories[index],),
      ),
    );
  }
}
