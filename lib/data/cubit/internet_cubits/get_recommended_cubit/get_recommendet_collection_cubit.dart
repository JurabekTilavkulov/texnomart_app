import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/model_recommended.dart';
import '../../../services/internet_service/net_service.dart';

part 'get_recommendet_collection_state.dart';

class GetRecommendetCollectionCubit extends Cubit<GetRecommendetCollectionState> {
  final NetService netService;
  GetRecommendetCollectionCubit(this.netService) : super(GetRecommendetCollectionInitialState());
  getRecommendedCollection()async{
    try{
      var response=await netService.getCollection();
      emit(GetRecommendetCollectionSuccessState(modelRecommendedProduct: response));
    }
    catch(e){
      emit(GetRecommendetCollectionFailureState());
    }
  }

}
