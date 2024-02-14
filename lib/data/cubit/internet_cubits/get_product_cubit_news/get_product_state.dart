part of 'get_product_cubit.dart';

@immutable
abstract class GetProductState {}

class GetProductInitialState extends GetProductState {}
class GetProductSuccessState extends GetProductState {
  final ModelProducts? modelProductsNews;


  GetProductSuccessState({this.modelProductsNews});
}
class GetProductFailureState extends GetProductState {}
