class ModelTexno {
  bool? success;
  String? message;
  int? code;
  Data1? data1;

  ModelTexno({this.success, this.message, this.code, this.data1});

  ModelTexno.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data1 = json['data'] != null ? new Data1.fromJson(json['data']) : null;
  }
 }

class Data1 {
  List<DataModel>? listData;

  Data1({this.listData});

  Data1.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listData = <DataModel>[];
      json['data'].forEach((v) {
        listData!.add(new DataModel.fromJson(v));
      });
    }
  }

}

class DataModel {
  int? id;
  String? link;
  String? title;
  String? imageWeb;
  String? imageMobileWeb;

  DataModel({this.id, this.link, this.title, this.imageWeb, this.imageMobileWeb});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    title = json['title'];
    imageWeb = json['image_web'];
    imageMobileWeb = json['image_mobile_web'];
  }

}
