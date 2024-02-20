part of 'main_page_cubit.dart';

@immutable
 class MainPageState {
  final int index;

  const MainPageState({this.index=0});

  MainPageState copyWith({int? indexCo}){
    return MainPageState(index: indexCo??index);
  }
}


