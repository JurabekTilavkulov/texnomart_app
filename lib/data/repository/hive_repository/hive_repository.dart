import 'package:hive/hive.dart';

import '../../models/model_good_by_id.dart';

class HiveRepository{
  final Box _box=Hive.box("tovarlar");
  //write
  putIntoCart(List<ModelProductsById> items){
    _box.put("savatcha", items);
  }
  saveToLike(List<ModelProductsById> items){
    _box.put("like", items);
  }

  //Read
  getFromCart(){
   List<ModelProductsById> list=[];
   list= _box.get("savatcha",defaultValue:<ModelProductsById>[]);
  // print("hiveRepo 19 list=${list[0].salePrise}");
    return list;
 }
   getLike(){
     List<ModelProductsById> list=[];
     list= _box.get("like",defaultValue:<ModelProductsById>[]);
     print("hiveRepo 24 list=${list[0].salePrise}");
    return list;
  }
}