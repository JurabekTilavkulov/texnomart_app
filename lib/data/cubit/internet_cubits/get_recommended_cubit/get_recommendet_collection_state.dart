part of 'get_recommendet_collection_cubit.dart';

@immutable
abstract class GetRecommendetCollectionState {}

class GetRecommendetCollectionInitialState extends GetRecommendetCollectionState {}
class GetRecommendetCollectionSuccessState extends GetRecommendetCollectionState {
  final ModelRecommendedProduct? modelRecommendedProduct;

  GetRecommendetCollectionSuccessState({required this.modelRecommendedProduct});
}
class GetRecommendetCollectionFailureState extends GetRecommendetCollectionState {}