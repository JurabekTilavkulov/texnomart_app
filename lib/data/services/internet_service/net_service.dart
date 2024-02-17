import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../models/model_category.dart';
import '../../models/model_detail.dart';
import '../../models/model_news.dart';
import '../../models/model_products.dart';
import '../../models/model_recommended.dart';
import '../../models/model_special_brands.dart';
import '../../models/model_texno.dart';

part 'net_service.g.dart';
//https://gateway.texnomart.uz/api/web/v1/content/sliders
//https://gateway.texnomart.uz/api/web/v1/home/special-brands
//https://gateway.texnomart.uz/api/web/v1/home/special-categories
//https://gateway.texnomart.uz/api/web/v1/home/special-products?type=new_products
//https://gateway.texnomart.uz/api/web/v1/home/collections
//https://gateway.texnomart.uz/api/web/v1/content/news
//https://gateway.texnomart.uz/api/web/v1/product/detail?id=356507
@RestApi(baseUrl: 'https://gateway.texnomart.uz/api/web/v1')
abstract class NetService{
  factory NetService(Dio dio,{String baseUrl})=_NetService;


@GET('/content/sliders') Future<ModelTexno> getInformn();

@GET('/home/special-brands') Future<ModelSpecialBrands> getSpecialBrands();

@GET('/home/special-categories') Future<ModelCategory> getCategory();

@GET('/home/special-products') Future<ModelProducts> getProducts(
    @Query('type') String product
    );

@GET('/home/collections') Future<ModelRecommendedProduct> getCollection();

@GET('/content/news') Future<ModelNews> getNews();

@GET('/product/detail') Future<DetailModel> getDetailInformation(
    @Query('id') int id
    );

}

