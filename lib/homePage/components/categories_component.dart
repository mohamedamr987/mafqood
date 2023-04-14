import 'package:flutter/material.dart';
import 'package:mafqood/homePage/widgets/category_widget.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20,),
      padding: const EdgeInsets.all(2,),
      height: 80,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const CategoryWidget(title: "Humans", image: "https://i.ibb.co/wQmqGYD/app-icon.png"),
      ),
    );
  }
}
