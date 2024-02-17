import 'package:floor/floor.dart';

@entity
class ModelProductsById{
  @PrimaryKey(autoGenerate: true)
  int? idProcuct;
  bool? like;
  String? name;
  int? salePrise;
  String? monthlyPrice;
  String? smallImage;

  ModelProductsById({
    this.idProcuct,
    this.like,
    this.name,
    this.salePrise,
    this.monthlyPrice,
    this.smallImage,
  });
  ModelProductsById.fromJson(Map<String, dynamic> json){
    idProcuct=json["id"];
    like=json["like"];
    name=json["name"];
    salePrise=json["salePrise"];
    monthlyPrice=json["monthlyPrice"];
    smallImage=json["smallImage"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"]=idProcuct;
    data["like"]=like;
    data["name"]=name;
    data["salePrise"]=salePrise;
    data["monthlyPrice"]=monthlyPrice;
    data["smallImage"]=smallImage;
    return data;
  }
}