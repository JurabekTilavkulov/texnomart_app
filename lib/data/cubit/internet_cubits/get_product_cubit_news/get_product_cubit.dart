import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/model_products.dart';
import '../../../services/internet_service/net_service.dart';

part 'get_product_state.dart';

class GetProductCubitNews extends Cubit<GetProductState> {
  GetProductCubitNews(this.netService) : super(GetProductInitialState());
  final NetService netService;

  getProductNews()async{
    var responce=await netService.getProducts('new_products');
    if(responce!=null){
      emit(GetProductSuccessState(modelProductsNews: responce));
    }
    else {
      emit(GetProductFailureState());
    }
  }

  // getProductHit()async{
  //   var responce=await netService.getProducts('hit_products');
  //   if(responce!=null){
  //     emit(GetProductSuccessState(modelProductsHits: responce));
  //   }
  //   else {
  //     emit(GetProductFailureState());
  //   }
  // }



}
