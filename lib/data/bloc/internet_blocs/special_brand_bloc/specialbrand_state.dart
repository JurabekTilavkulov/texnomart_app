part of 'specialbrand_bloc.dart';

@immutable
abstract class SpecialbrandState {}

class SpecialbrandInitialState extends SpecialbrandState {}
class SpecialbrandSuccessState extends SpecialbrandState {
  final ModelSpecialBrands modelSpecialBrands;
  SpecialbrandSuccessState({required this.modelSpecialBrands});
}
class SpecialbrandFailureState extends SpecialbrandState {
  final String failure;
  SpecialbrandFailureState(this.failure);
}
