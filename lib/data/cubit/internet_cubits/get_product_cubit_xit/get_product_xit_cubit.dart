import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:texnomart_app/data/models/model_products.dart';
import 'package:texnomart_app/data/services/internet_service/net_service.dart';

part 'get_product_xit_state.dart';

class GetProductXitCubit extends Cubit<GetProductXitState> {
  GetProductXitCubit({required this.netService}) : super(GetProductXitInitialState());
  final NetService netService;
  getProductsXit()async {
    try{
      var response=await netService.getProducts('hit_products');
      emit(GetProductXitSuccesslSate(response));
    }
    catch (e){
      emit(GetProductXitFailureSate());
    }

  }
}
