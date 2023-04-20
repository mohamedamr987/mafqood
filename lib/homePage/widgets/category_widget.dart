import 'package:flutter/material.dart';
import 'package:mafqood/allReportsPage/all_reports_page_view.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/core/models/category_model.dart';
import 'package:mafqood/widgets/cache_image_widget.dart';
import 'package:mafqood/widgets/general_text.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryWidget({Key? key, required this.categoryModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> NavigationHelper.push(context, AllReportsPageView(categoryModel: categoryModel,)),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: CacheImageWidget(image: categoryModel.image, fit: BoxFit.cover, width: 50, height: 50,),
            ),
            const SizedBox(height: 4,),
            GeneralText(text: categoryModel.name, size: 12, isBold: true,),
          ],
        ),
      ),
    );
  }
}
