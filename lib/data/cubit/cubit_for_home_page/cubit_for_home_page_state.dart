part of 'cubit_for_home_page_cubit.dart';

class CubitHomePState {
  final Status? status;
  final TextEditingController? textEditingController;
  final int? indexSlider;
  final int? listCountSlider;

  // final bool? isEyeShow;
  // final bool? following;
  // final bool? chekBox;
  // int count;
  // final String? select;
  // final int? value1;


  CubitHomePState({
    this.status,
    this.textEditingController,
    this.indexSlider=0,
    this.listCountSlider=0,
    // this.isEyeShow = false,
    // this.chekBox = false,
    // this.count=0,
    // this.select='',
    // this.value1=0,
    // this.following=false

  });

  CubitHomePState copyWith({
     Status? status,
    TextEditingController? textEditingController,
    int? indexSlider,
    int? listCountSlider,
    // bool? isEyeShow,
    // bool? chekBox,
    // int? count,
    // String? select,
    // int? value1A,   // bunda ValueA SplashState ning copyWith funcsiyasini maydoni
    // bool? following
  }) {
    return CubitHomePState(
         status: status ?? this.status,
        textEditingController: textEditingController ?? this.textEditingController,
        indexSlider: indexSlider??this.indexSlider,
        listCountSlider: listCountSlider??this.listCountSlider,
        // isEyeShow: isEyeShow ?? this.isEyeShow,
        // chekBox: chekBox ?? this.chekBox,
        // count: count ?? this.count,
        // select: select ?? this.select,
        // value1: value1A ?? this.value1, //funcsiyasi orqali qiymat berilgan bolsa, classni maydonini shu funksiya orqali cantructor yordami bilan to'ldiradi
        // following: following ?? this.following
    );                               /* aks xolda qiymat berilmagan bo'lsa, constructor orqali oladi  */
  }
}