

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:texnomart_app/data/models/model_category.dart';

import '../../../services/internet_service/net_service.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final NetService netService;
  CategoryBloc({required this.netService}) : super(CategoryInitialState()) {
    on<CategoryLoadedEvent>((event, emit) async{
    try{
      ModelCategory modelCategory=await netService.getCategory();
      emit(CategorySuccessState(modelCategory: modelCategory));
    }
    catch (e){
      emit(CategoryFailureState());
    }
    });
  }
}
