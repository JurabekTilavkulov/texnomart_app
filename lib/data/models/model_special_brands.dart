class ModelSpecialBrands {
  bool? success;
  String? message;
  int? code;
  DataList? data;

  ModelSpecialBrands({this.success, this.message, this.code, this.data});

  ModelSpecialBrands.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? DataList.fromJson(json['data']) : null;
  }
}
class DataList {
  List<DataModel>? dataList;

  DataList({this.dataList});

  DataList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataList = <DataModel>[];
      json['data'].forEach((v) {
        dataList!.add(DataModel.fromJson(v));
      });
    }
  }
}
class DataModel {
  String? name;
  String? slug;
  String? image;

  DataModel({this.name, this.slug, this.image});

  DataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    image = json['image'];

  }
}



