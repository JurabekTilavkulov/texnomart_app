class ModelCategory {
  bool? success;
  String? message;
  int? code;
  DataList? data;

  ModelCategory({this.success, this.message, this.code, this.data});

  ModelCategory.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? DataList.fromJson(json['data']) : null;
  }


}

class DataList {
  List<DataModel1>? data;

  DataList({this.data});

  DataList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataModel1>[];
      json['data'].forEach((v) {
        data!.add(DataModel1.fromJson(v));
      });
    }
  }


}

class DataModel1 {
  String? title;
  String? image;
  String? slug;

  DataModel1({this.title, this.image, this.slug});

  DataModel1.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    slug = json['slug'];
  }


}
