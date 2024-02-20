part of 'specialbrand_bloc.dart';

@immutable
abstract class SpecialbrandState {}

class SpecialbrandInitialState extends SpecialbrandState {}

class SpecialbrandSuccessState extends SpecialbrandState {

  final ModelSpecialBrands modelSpecialBrands;
  final ModelTexno modelTexno;
  final ModelCategory modelCategory;
  final ModelNews modelNews;
  final ModelProducts modelProductsNews;
  final ModelProducts modelProductsXit;
  final ModelRecommendedProduct modelRecommendedProduct;

   SpecialbrandSuccessState({
  required this.modelSpecialBrands,
  required this.modelTexno,
  required this.modelCategory,
  required this.modelNews,
  required this.modelProductsNews,
  required this.modelProductsXit,
  required this.modelRecommendedProduct
  });
}
class SpecialbrandFailureState extends SpecialbrandState {
  final String failure;
  SpecialbrandFailureState(this.failure);
}
