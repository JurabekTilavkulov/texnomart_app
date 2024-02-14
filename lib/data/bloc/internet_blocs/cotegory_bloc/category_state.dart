part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}
class CategorySuccessState extends CategoryState {
  final ModelCategory modelCategory;
  CategorySuccessState({required this.modelCategory});
}
class CategoryFailureState extends CategoryState {}
