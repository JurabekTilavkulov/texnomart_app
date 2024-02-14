class ModelProducts {
  bool? success;
  String? message;
  int? code;
  DataList? dataMap;

  ModelProducts({this.success, this.message, this.code, this.dataMap});

  ModelProducts.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    dataMap = json['data'] != null ? DataList.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataz = {};
    dataz['success'] = success;
    dataz['message'] = message;
    dataz['code'] = code;
    if (dataMap != null) {
      dataz['data'] = dataMap!.toJson();
    }
    return dataz;
  }
}

class DataList {
  List<DataModelA>? datalist;

  DataList({this.datalist});

  DataList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      datalist = <DataModelA>[];
      json['data'].forEach((v) {
        datalist!.add( DataModelA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> datay ={};
    if (datalist != null) {
      datay['data'] = datalist!.map((v) => v.toJson()).toList();
    }
    return datay;
  }
}

class DataModelA {
  int? id;
  String? name;
  String? image;
  String? availability;
  String? axiomMonthlyPrice;
  int? salePrice;
  int? reviewsCount;
  int? allCount;


  DataModelA(
      {this.id,
        this.name,
        this.image,
        this.availability,
        this.axiomMonthlyPrice,
        this.salePrice,
        this.reviewsCount,
        this.allCount,
       });

  DataModelA.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    availability = json['availability'];
    axiomMonthlyPrice = json['axiom_monthly_price'];
    salePrice = json['sale_price'];
    reviewsCount = json['reviews_count'];
    allCount = json['all_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> datax = Map<String, dynamic>();
    datax['id'] = id;
    datax['name'] = name;
    datax['image'] = image;
    datax['availability'] = availability;
    datax['axiom_monthly_price'] = axiomMonthlyPrice;
    datax['sale_price'] = salePrice;
    datax['reviews_count'] = reviewsCount;
    datax['all_count'] = allCount;
    return datax;
  }
}
