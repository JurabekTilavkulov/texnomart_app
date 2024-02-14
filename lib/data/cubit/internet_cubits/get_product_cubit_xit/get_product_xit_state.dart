part of 'get_product_xit_cubit.dart';

@immutable
abstract class GetProductXitState {}

class GetProductXitInitialState extends GetProductXitState {}
class GetProductXitSuccesslSate extends GetProductXitState {
  final ModelProducts? modelProducts;
  GetProductXitSuccesslSate(this.modelProducts);
}
class GetProductXitFailureSate extends GetProductXitState {}