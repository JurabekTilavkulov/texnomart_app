import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:svg_flutter/svg.dart';
import 'package:texnomart_app/data/utils/app_svg.dart';
import 'package:texnomart_app/data/utils/local_keys.dart';
import 'package:texnomart_app/ui/widgets/special_brands.dart';
import '../../../data/bloc/internet_blocs/special_brand_bloc/specialbrand_bloc.dart';
import '../../../data/cubit/cubit_for_home_page/cubit_for_home_page_cubit.dart';
import '../../../data/services/internet_service/net_service.dart';
import '../../widgets/category_list.dart';
import '../../widgets/home_page_slider_list.dart';
import 'homePageItembuildNews.dart';
import 'home_page_item_recommended.dart';
import 'home_page_news_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SpecialbrandBloc(netService: NetService(Dio()))
            ..add(SpecialLoadedEvent()),
        ),
        BlocProvider(create: (context) => ForHomePageCubit()),
      ],
      child: BlocBuilder<SpecialbrandBloc, SpecialbrandState>(
        builder: (context, state) {
          if (state is SpecialbrandInitialState) {
            return Scaffold(
              body: Container(
                color: Colors.white,
                child: Center(
                    child: LoadingAnimationWidget.twoRotatingArc(
                        color: Colors.amber, size: 50)),
              ),
            );
          }
          else if (state is SpecialbrandSuccessState) {
            List<int> n = [];
            n.clear();
            int p = 0;
            state.modelTexno.data1?.listData?.forEach((element) {
              n.add(p);
              p++;
            });
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.yellow.shade700,
                    floating: false,
                    pinned: false,
                    title: Center(
                        child: SvgPicture.asset(
                      AppSvg.texnomartLogo,
                      width: MediaQuery.of(context).size.width * 0.4,
                    )),
                  ),
                  SliverAppBar(
                    shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    floating: false,
                    pinned: true,
                    backgroundColor: Colors.yellow[700],
                    title: Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 1),
                      height: 54,
                      child: Center(
                        child: TextField(
                            onTap: () {},
                            controller: textEditingController,
                            decoration: InputDecoration(
                              hintText: LocalKeys.illbuy.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              // labelText: "Men sotib olmoqchiman",
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              suffixIcon:
                                  const Icon(Icons.mic, color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white,
                            )),
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    fillOverscroll: true,
                    hasScrollBody: true,
                    child: BlocBuilder<ForHomePageCubit, CubitHomePState>(
                      // cubit
                      builder: (contextCubit, stateCubit) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarouselSlider(
                                carouselController: carouselController,
                                options: CarouselOptions(
                                    viewportFraction: 0.97,
                                    height: MediaQuery.of(context).size.height *
                                        0.23,
                                    autoPlay: true,
                                    enlargeFactor: 1.1,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index, reason) {
                                      contextCubit
                                          .read<ForHomePageCubit>()
                                          .indexSlider(index);
                                    },
                                    enlargeCenterPage: true,
                                    disableCenter: false),
                                items: n.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return itemBulder_for_slider(
                                          context, i, state.modelTexno);
                                    },
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                child: DotsIndicator(
                                  position: stateCubit.indexSlider ?? 0,
                                  decorator: const DotsDecorator(
                                    activeColor: Colors.black,
                                  ),
                                  dotsCount: 7,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return specialBrandsitem(context, index,
                                        state.modelSpecialBrands);
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.modelSpecialBrands.data
                                          ?.dataList?.length ??
                                      0,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("   ${LocalKeys.category.tr()}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                                "${LocalKeys.all.tr()}>",
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey)))
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemBuilder: (context, index) {
                                          return categorylisttem(context, index,
                                              state.modelCategory);
                                        },
                                        itemCount: state.modelCategory.data
                                                ?.data?.length ??
                                            0,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Divider(
                                  color: Color(0xFFC2C2C1),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(LocalKeys.newgoods.tr(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.31,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return itemBuldForPageNews(context, index,
                                        state.modelProductsNews);
                                  },
                                  itemCount: state.modelProductsNews.dataMap
                                          ?.datalist?.length ??
                                      0,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Divider(
                                  color: Color(0xFFC2C2C1),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(LocalKeys.xitTovar.tr(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.31,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return itemBuldForPageNews(context, index,
                                        state.modelProductsNews);
                                  },
                                  itemCount: state.modelProductsNews.dataMap
                                          ?.datalist?.length ??
                                      0,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Divider(
                                  color: Color(0xFFC2C2C1),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("   ${LocalKeys.news_blogs.tr()}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text("${LocalKeys.all.tr()}>",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey)))
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.28,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return itemNewsHomePage(
                                        context, index, state.modelNews);
                                  },
                                  itemCount:
                                      state.modelNews.data?.list?.length ?? 0,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Divider(
                                      color: Color(0xFFC2C2C1),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                        state.modelRecommendedProduct.dataLista
                                                ?.list![0].name ??
                                            '',
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.31,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return itemBuldForRecommended(
                                            context,
                                            index,
                                            state.modelRecommendedProduct,
                                            0);
                                      },
                                      itemCount: state
                                              .modelRecommendedProduct
                                              .dataLista
                                              ?.list?[0]
                                              .products
                                              ?.length ??
                                          0,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Divider(
                                      color: Color(0xFFC2C2C1),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                        state.modelRecommendedProduct.dataLista
                                                ?.list![1].name ??
                                            '',
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.31,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return itemBuldForRecommended(
                                            context,
                                            index,
                                            state.modelRecommendedProduct,
                                            1);
                                      },
                                      itemCount: state
                                              .modelRecommendedProduct
                                              .dataLista
                                              ?.list?[1]
                                              .products
                                              ?.length ??
                                          0,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Divider(
                                      color: Color(0xFFC2C2C1),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                        state.modelRecommendedProduct.dataLista
                                                ?.list![2].name ??
                                            '',
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.31,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return itemBuldForRecommended(
                                            context,
                                            index,
                                            state.modelRecommendedProduct,
                                            2);
                                      },
                                      itemCount: state
                                              .modelRecommendedProduct
                                              .dataLista
                                              ?.list?[2]
                                              .products
                                              ?.length ??
                                          0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is SpecialbrandFailureState) {
            return Scaffold(
                body: Expanded(
                    child: Container(
                        color: Colors.white,
                        child: Text("Error: ${state.failure}"))));
          } else {
            return const Scaffold(
              body: Center(
                child: Text("No error, nothing"),
              ),
            );
          }
        },
      ),
    );
  }
}
