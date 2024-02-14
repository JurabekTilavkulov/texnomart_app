part of 'cubit_for_nav_bar_cubit.dart';


 class ForNavBarState {
  final int index;
   ForNavBarState({this.index=0});// Constructor majbur bo'lmagan field bilan

  ForNavBarState copyWith({int? indexF}){ // shu classga aloqodor funksiya
    return ForNavBarState(index: indexF??index); //return bo'lib shu classni qaytaradi
  }



}


