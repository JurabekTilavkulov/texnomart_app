part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailInitialState extends DetailState {}
class DetailSuccessState extends DetailState {
  final DetailModel? detailModel;

  DetailSuccessState(this.detailModel);
}
class DetailFailureState extends DetailState {}
