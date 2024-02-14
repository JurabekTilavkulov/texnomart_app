import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';


part 'cubit_for_home_page_state.dart';
enum Status{
  initial,
  loding,
  loaded,
  error}
class ForHomePageCubit extends Cubit<CubitHomePState> {
  ForHomePageCubit() : super(CubitHomePState());

  void textEditingCubit(TextEditingController text) async {
    emit(state.copyWith(textEditingController: text));
  }

  void indexSlider(int index)async{
    emit(state.copyWith(indexSlider: index));
  }
  void listCountSlider(int index)async{
    emit(state.copyWith(listCountSlider: index));
  }
}
