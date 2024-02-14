import 'package:bloc/bloc.dart';



part 'cubit_for_nav_bar_state.dart';

class ForNavBarCubit extends Cubit<ForNavBarState> {
  ForNavBarCubit() : super( ForNavBarState());

  void isIndex(int index)async{
    emit(state.copyWith(indexF: index));
  }
}
