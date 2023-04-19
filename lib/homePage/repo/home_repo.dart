import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/core/errors/failures.dart';
import 'package:mafqood/core/models/category_model.dart';
import 'package:mafqood/core/repo/repo.dart';

class HomeRepo extends Repository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    return await exceptionHandler<List<CategoryModel>>(
      () async {
        List<CategoryModel> categories = [];
        await firestore.collection('categories').get().then((value) => value.docs.forEach((element) {
                  categories.add(CategoryModel.fromJson(element.data()));
                }));
        return categories;
      },
    );
  }


}
