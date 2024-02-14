
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/model_special_brands.dart';
import '../../../services/internet_service/net_service.dart';

part 'specialbrand_event.dart';
part 'specialbrand_state.dart';

class SpecialbrandBloc extends Bloc<SpecialbrandEvent, SpecialbrandState> {
  final NetService netService;

  SpecialbrandBloc({required this.netService}) : super(SpecialbrandInitialState()) {
    on<SpecialLoadedEvent>((event, emit) async{
      try{
        ModelSpecialBrands modelSpecialBrands=await netService.getSpecialBrands();
        emit(SpecialbrandSuccessState(modelSpecialBrands: modelSpecialBrands));
      }
      catch(e){
        emit(SpecialbrandFailureState(e.toString()));
      }


    });
  }
}
