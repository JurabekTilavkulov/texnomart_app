part of 'get_news_cubit.dart';

@immutable
abstract class GetNewsState {}

class GetNewsInitialState extends GetNewsState {}
class GetNewsSuccessState extends GetNewsState {
  final ModelNews? modelNews;
  GetNewsSuccessState({required this.modelNews});
}
class GetNewsFailureState extends GetNewsState {}
