
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/model_detail.dart';
import '../../../services/internet_service/net_service.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final NetService netService;
  DetailBloc(this.netService) : super(DetailInitialState()) {
    on<DetailLoadedEvent>((event, emit) async{
     try{
       var response=await netService.getDetailInformation(event.id);
       emit(DetailSuccessState(response));
     }
     catch(e){
       emit(DetailFailureState());
     }
    });
  }
}
