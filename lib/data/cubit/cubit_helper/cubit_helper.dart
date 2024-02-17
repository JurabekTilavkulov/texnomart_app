import 'package:bloc/bloc.dart';

import '../../models/model_good_by_id.dart';
import '../../services/DB/date_base_service.dart';



part 'cubit_helper_state.dart';

class CubitHelper extends Cubit<CubitHelperState> {
  CubitHelper({required this.dataBaseservice}) : super( CubitHelperState());
  DataBaseservice dataBaseservice;
  void isIndex(int index)async{
    emit(state.copyWith(indexF: index));
  }
  void isDotIndIndex(int index)async{
    emit(state.copyWith(indexDotInd: index));
  }
  void isNumberToStringSplitted(int a)async{
    String s='';
    try{
      int p=a.toString().length;

      for(int i=0;i<p;i++){
        s=s+a.toString()[i];

        if(p%3==0 && (i==2 ||i==5 || i==8 || i==11) ) {
          s=s+" ";

        };
        if(p%3==1 && (i==0 || i==3 ||i==6 || i==9) ) {
          s=s+" ";;

        };
        if(p%3==2 && (i==1 || i==4 || i==7 || i==10)) {
          s=s+" ";;

        };
      }
      emit(state.copyWith(numberN: s));

    }
    catch(e){
      emit(state.copyWith(numberN: "Error"));
    }
  }
  void isChangeColor(bool colorChange) {
    emit(state.copyWith(colorCh:colorChange));
  }
  void isLikeUnlike(bool like){
    emit(state.copyWith(likeUnlikeC: like));
  }
  getAllProducts()async{
    List<ModelProductsById> list=await dataBaseservice.readAllProducts();
    emit(state.copyWith(products: list));
  }
  void insertProductsToCart(ModelProductsById modelProductsById) async{
    await dataBaseservice.insertProduct(modelProductsById);
  }
  void removeProduct(ModelProductsById modelProductsById) async{
    await dataBaseservice.deleteProduct(modelProductsById);
  }
}
