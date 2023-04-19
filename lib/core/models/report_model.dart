import '../core_info.dart';

class ReportModel{
  String docId;
  String name;
  String age;
  String place;
  String description;
  String image;
  int categoryId;
  String userUid;
  ReportModel({
    required this.docId,
    required this.name,
    required this.age,
    required this.place,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.userUid,
  });

  bool get isReportMine => userUid == CoreInfo.auth.currentUser!.uid;

  factory ReportModel.fromJson(Map<String,dynamic> json, String docId){
    return ReportModel(
      docId: docId,
      name: json["name"],
      age: json["age"],
      place: json["place"],
      description: json["description"],
      image: json["image"],
      categoryId: json["category_id"],
      userUid: json["user_uid"],
    );
  }
}