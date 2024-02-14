part of 'sliders_bloc.dart';

@immutable
abstract class SlidersState {}

class SlidersInitialState extends SlidersState {}
class SlidersSuccseslState extends SlidersState {
  final ModelTexno modelTexno;
  SlidersSuccseslState({required this.modelTexno});
}
class SliderFailureState extends SlidersState {}
