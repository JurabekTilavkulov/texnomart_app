import 'dart:async';
import 'package:floor/floor.dart';
import 'package:texnomart_app/data/services/DB/product_dao.dart';
import '../../models/model_good_by_id.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';
@Database(version: 1, entities: [ModelProductsById])
abstract class AppDatabase extends FloorDatabase{
  ProductDao get productDao;
}