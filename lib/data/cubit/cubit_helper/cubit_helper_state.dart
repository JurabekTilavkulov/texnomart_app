part of 'cubit_helper.dart';


 class CubitHelperState {
  final int index;
  final int indexDotIndicator;
  final String number;
  final bool colorChangeVeriable;
  final bool likeUnlike;
  final List<ModelProductsById>? products;
   CubitHelperState({
    this.index=0,
    this.colorChangeVeriable=false,
    this.indexDotIndicator=0,
    this.number='',
    this.likeUnlike=false,
    this.products,
   });// Constructor majbur bo'lmagan field bilan

  CubitHelperState copyWith({
   int? indexF,
   int? indexDotInd,
   String? numberN,
   bool? colorCh,
   bool? likeUnlikeC,
    List<ModelProductsById>? products,

  })
  { // shu classga aloqodor funksiya
    return CubitHelperState(
        index: indexF??index,
        indexDotIndicator: indexDotInd??indexDotIndicator,
        number: numberN??number,
     colorChangeVeriable: colorCh??colorChangeVeriable,
     likeUnlike: likeUnlikeC??likeUnlike,
     products: products??this.products
    ); //return bo'lib shu classni qaytaradi
  }

}


