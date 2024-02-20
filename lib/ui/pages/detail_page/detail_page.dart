import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:svg_flutter/svg.dart';
import 'package:texnomart_app/data/models/model_good_by_id.dart';
import 'package:texnomart_app/data/repository/hive_repository/hive_repository.dart';
import 'package:texnomart_app/data/utils/app_svg.dart';
import 'package:texnomart_app/data/utils/number_extension.dart';
import '../../../data/bloc/internet_blocs/detail_bloc/detail_bloc.dart';
import '../../../data/cubit/cubit_helper/cubit_helper.dart';
import '../../../data/utils/local_keys.dart';
import 'detail_image_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      bloc: context.read<DetailBloc>()..add(DetailLoadedEvent(id: id)),
      builder: (context, state) {
        if (state is DetailSuccessState) {
          return BlocBuilder<CubitHelper, CubitHelperState>(
            builder: (contextCubit, stateCubit) {
              print("datail Page 35 like");
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.amber,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppSvg.compareBlack),
                    ),
                    IconButton(
                        onPressed: () async {
                           contextCubit.read<CubitHelper>().isLikeUnlike(true);
                        },
                        icon: SvgPicture.asset(
                          AppSvg.likeBlack,
                          color: stateCubit.likeUnlike ? Colors.red : null,
                        )),
                  ],
                ),
                body: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.71,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: PageView.builder(
                                  itemBuilder: (context, index) {
                                    contextCubit
                                        .read<CubitHelper>()
                                        .isDotIndIndex(index);
                                    return detailimageItem(
                                        context, index, state.detailModel);
                                  },
                                  itemCount: state.detailModel!.data!.dataInner!
                                      .largeImages!.length),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.03,
                              child: DotsIndicator(
                                position: stateCubit.indexDotIndicator,
                                decorator: const DotsDecorator(
                                  activeColor: Colors.black,
                                ),
                                dotsCount: state.detailModel!.data!.dataInner!
                                    .largeImages!.length,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.detailModel!.data!.dataInner!
                                      .availability!,
                                  style: const TextStyle(color: Colors.green),
                                ),
                                Text(
                                    "${LocalKeys.code.tr()} ${state.detailModel!.data!.dataInner!.code!}"),
                              ],
                            ),
                            Text(
                              state.detailModel!.data!.dataInner!.name!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${state.detailModel!.data!.dataInner!.salePrice!.numerFormatEasytToRead()} so'm",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0x6BC5C2C2)),
                                child: Center(
                                    child: Text(
                                        "${LocalKeys.monthlyPrice.tr()} ${state.detailModel!.data!.dataInner!.monthlyPrice!}")),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            //manashu joyda savatchaga hive ga saqlanadi

                            contextCubit
                                .read<CubitHelper>()
                                .insertProductsToCart(ModelProductsById(
                                    idProcuct: state
                                        .detailModel!.data!.dataInner!.id,
                                    name:
                                        state
                                            .detailModel!.data!.dataInner!.name,
                                    salePrise: state.detailModel!.data!
                                        .dataInner!.salePrice,
                                    smallImage: state.detailModel!.data!
                                        .dataInner!.smallImages![0],
                                    monthlyPrice: state.detailModel!.data!
                                        .dataInner!.monthlyPrice,
                                    like: stateCubit.likeUnlike));
                            contextCubit
                                .read<CubitHelper>()
                                .isChangeColor(!stateCubit.colorChangeVeriable);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: stateCubit.colorChangeVeriable
                                    ? null
                                    : Colors.amber,
                                border:
                                    Border.all(color: Colors.amber, width: 2)),
                            child: Center(
                                child: Text(
                              LocalKeys.tocard.tr(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
        else if (state is DetailInitialState) {
          return Container(
              color: Colors.white,
              child: Center(
                child: LoadingAnimationWidget.twoRotatingArc(
                    color: Colors.amber, size: 50),
              ));
        }
        else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }
}
