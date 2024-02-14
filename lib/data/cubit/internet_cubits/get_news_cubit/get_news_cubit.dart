import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/model_news.dart';
import '../../../services/internet_service/net_service.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  final NetService netService;
  GetNewsCubit(this.netService) : super(GetNewsInitialState());

  getNews()async{
    try{
      var response=await netService.getNews();
      emit(GetNewsSuccessState(modelNews: response));
    }
    catch (e){
      emit(GetNewsFailureState());
    }
  }
}
