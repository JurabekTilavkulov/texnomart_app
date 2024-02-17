import 'package:floor/floor.dart';
import 'package:texnomart_app/data/models/model_good_by_id.dart';

@dao
abstract class ProductDao{
  @Query("SELECT * FROM ModelProductsById")
  Future<List<ModelProductsById>> readAll();

  @insert
  Future<void> insertProduct(ModelProductsById modelProductsById);

  @delete
  Future<void> deleteProduct(ModelProductsById modelProductsById);

}