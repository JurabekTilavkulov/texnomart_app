
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/model_category.dart';
import '../../../models/model_news.dart';
import '../../../models/model_products.dart';
import '../../../models/model_recommended.dart';
import '../../../models/model_special_brands.dart';
import '../../../models/model_texno.dart';
import '../../../services/internet_service/net_service.dart';

part 'specialbrand_event.dart';
part 'specialbrand_state.dart';

class SpecialbrandBloc extends Bloc<SpecialbrandEvent, SpecialbrandState> {
  final NetService netService;

  SpecialbrandBloc({required this.netService}) : super(SpecialbrandInitialState()) {
    on<SpecialLoadedEvent>((event, emit) async{
      try{
        ModelSpecialBrands modelSpecialBrands=await netService.getSpecialBrands();
        ModelTexno modelTexno= await netService.getInformn();
        ModelCategory modelCategory=await netService.getCategory();
        ModelNews modelNews=await netService.getNews();
        ModelProducts modelProductsNews=await netService.getProducts('new_products');
        ModelProducts modelProductsXit=await netService.getProducts('hit_products');
        ModelRecommendedProduct modelRecommendedProduct=await netService.getCollection();

        emit(SpecialbrandSuccessState(
            modelSpecialBrands: modelSpecialBrands,
            modelTexno: modelTexno,
            modelCategory: modelCategory,
            modelNews: modelNews,
            modelProductsNews: modelProductsNews,
            modelProductsXit: modelProductsXit,
            modelRecommendedProduct: modelRecommendedProduct
        ));
      }
      catch(e){
        emit(SpecialbrandFailureState(e.toString()));
      }
    });
  }
}
