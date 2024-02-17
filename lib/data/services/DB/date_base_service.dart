import 'package:texnomart_app/data/services/DB/app_database.dart';

import '../../models/model_good_by_id.dart';

class DataBaseservice{
  static final DataBaseservice _dataBaseservice=DataBaseservice._internal();
  factory DataBaseservice(){
    return _dataBaseservice;
  }
  DataBaseservice._internal();
  late AppDatabase _database;
  Future initialDB()async{
    _database=await $FloorAppDatabase.databaseBuilder("savatcha.db").build();
  }
  Future<List<ModelProductsById>> readAllProducts()async{
    return await _database.productDao.readAll();
  }
  Future<void> insertProduct(ModelProductsById productsById)async{
    return await _database.productDao.insertProduct(productsById);
  }
  Future<void> deleteProduct(ModelProductsById modelProductsById)async{
    return await _database.productDao.deleteProduct(modelProductsById);
  }
}