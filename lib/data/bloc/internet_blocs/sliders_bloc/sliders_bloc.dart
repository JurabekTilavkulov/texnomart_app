

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/model_texno.dart';
import '../../../services/internet_service/net_service.dart';

part 'sliders_event.dart';
part 'sliders_state.dart';

class SlidersBloc extends Bloc<SlidersEvent, SlidersState> {
  final NetService netService;

  SlidersBloc({required this.netService}) : super(SlidersInitialState()) {
    on<LoadedEvent>((event, emit) async{
      try{
        ModelTexno modelTexno= await netService.getInformn();
        emit(SlidersSuccseslState(modelTexno: modelTexno));
      }
      catch(e){
        print("e=${e}");
        emit(SliderFailureState());
      }


    });
  }
}
