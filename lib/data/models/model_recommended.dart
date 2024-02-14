class ModelRecommendedProduct {
  bool? success;
  String? message;
  int? code;
  DataList? dataLista;

  ModelRecommendedProduct({this.success, this.message, this.code, this.dataLista});

  ModelRecommendedProduct.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    dataLista = json['data'] != null ? DataList.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    data['code'] = code;
    if (dataLista != null) {
      data['data'] = dataLista!.toJson();
    }
    return data;
  }
}

class DataList {
  List<DataModel>? list;

  DataList({this.list});

  DataList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      list = <DataModel>[];
      json['data'].forEach((v) {
        list!.add(DataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (list != null) {
      data['data'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataModel {
  int? id;
  String? name;
  String? slug;
  List<Products>? products;

  DataModel({this.id, this.name, this.slug, this.products});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? image;
  String? availability;
  String? axiomMonthlyPrice;
  int? salePrice;
  int? oldPrice;
  int? reviewsCount;
  int? reviewsAverage;
  int? allCount;
  List<Stickers>? stickers;
  List<SaleMonths>? saleMonths;

  Products(
      {this.id,
        this.name,
        this.image,
        this.availability,
        this.axiomMonthlyPrice,
        this.salePrice,
        this.oldPrice,
        this.reviewsCount,
        this.reviewsAverage,
        this.allCount,
        this.stickers,
        this.saleMonths});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    availability = json['availability'];
    axiomMonthlyPrice = json['axiom_monthly_price'];
    salePrice = json['sale_price'];
    oldPrice = json['old_price'];
    reviewsCount = json['reviews_count'];
    reviewsAverage = json['reviews_average'];
    allCount = json['all_count'];
    if (json['stickers'] != null) {
      stickers = <Stickers>[];
      json['stickers'].forEach((v) {
        stickers!.add(new Stickers.fromJson(v));
      });
    }
    if (json['sale_months'] != null) {
      saleMonths = <SaleMonths>[];
      json['sale_months'].forEach((v) {
        saleMonths!.add(new SaleMonths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['availability'] = this.availability;
    data['axiom_monthly_price'] = this.axiomMonthlyPrice;
    data['sale_price'] = this.salePrice;
    data['old_price'] = this.oldPrice;
    data['reviews_count'] = this.reviewsCount;
    data['reviews_average'] = this.reviewsAverage;
    data['all_count'] = this.allCount;
    if (this.stickers != null) {
      data['stickers'] = this.stickers!.map((v) => v.toJson()).toList();
    }
    if (this.saleMonths != null) {
      data['sale_months'] = this.saleMonths!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stickers {
  String? name;
  String? backgroundColor;
  String? textColor;
  bool? isImage;
  bool? showInCard;

  Stickers(
      {this.name,
        this.backgroundColor,
        this.textColor,
        this.isImage,
        this.showInCard});

  Stickers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    backgroundColor = json['background_color'];
    textColor = json['text_color'];
    isImage = json['is_image'];
    showInCard = json['show_in_card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap ={};
    dataMap['name'] = name;
    dataMap['background_color'] = backgroundColor;
    dataMap['text_color'] = textColor;
    dataMap['is_image'] = isImage;
    dataMap['show_in_card'] = showInCard;
    return dataMap;
  }
}

class SaleMonths {
  int? id;
  String? key;
  String? name;
  String? image;

  SaleMonths({this.id, this.key, this.name, this.image});

  SaleMonths.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['key'] = key;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
