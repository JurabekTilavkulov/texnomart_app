import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:svg_flutter/svg.dart';
import 'package:texnomart_app/data/utils/local_keys.dart';
import 'package:texnomart_app/ui/widgets/special_brands.dart';
import '../../../data/bloc/internet_blocs/cotegory_bloc/category_bloc.dart';
import '../../../data/bloc/internet_blocs/sliders_bloc/sliders_bloc.dart';
import '../../../data/bloc/internet_blocs/special_brand_bloc/specialbrand_bloc.dart';
import '../../../data/cubit/cubit_for_home_page/cubit_for_home_page_cubit.dart';
import '../../../data/cubit/internet_cubits/get_news_cubit/get_news_cubit.dart';
import '../../../data/cubit/internet_cubits/get_product_cubit_news/get_product_cubit.dart';
import '../../../data/cubit/internet_cubits/get_product_cubit_xit/get_product_xit_cubit.dart';
import '../../../data/cubit/internet_cubits/get_recommended_cubit/get_recommendet_collection_cubit.dart';
import '../../../data/services/internet_service/net_service.dart';
import '../../widgets/category_list.dart';
import '../../widgets/home_page_slider_list.dart';
import 'homePageItembuildNews.dart';
import 'home_page_item_recommended.dart';



class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  final TextEditingController textEditingController=TextEditingController();
   final CarouselController carouselController=CarouselController();

  @override
  Widget build(BuildContext context) {
   context.read<GetProductCubitNews>().getProductNews();
   context.read<GetProductXitCubit>().getProductsXit();
   context.read<GetRecommendetCollectionCubit>().getRecommendedCollection();
   context.read<GetNewsCubit>().getNews();

    return  MultiBlocProvider(providers: [
        BlocProvider(create: (context)=>SlidersBloc(netService: NetService(Dio()))..add(LoadedEvent())),
        BlocProvider(create: (context)=>ForHomePageCubit()),
        BlocProvider(create: (context)=>SpecialbrandBloc(netService: NetService(Dio()))..add(SpecialLoadedEvent())),
        BlocProvider(create: (context)=>CategoryBloc(netService: NetService(Dio()))..add(CategoryLoadedEvent())),

    ],child:  Scaffold(

      body:  CustomScrollView(
        slivers: [
          SliverAppBar(

            backgroundColor: Colors.yellow.shade700,
            floating: false,
            pinned: false,
            title: Center(child: SvgPicture.asset('assets/svg/texnomart-logo.fcda25c.svg',width: MediaQuery.of(context).size.width*0.4,)),
          ),
          SliverAppBar(
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              borderSide: BorderSide.none,),
            floating: false,
            pinned: true,
            backgroundColor: Colors.yellow[700],
            title: Container(
              padding: const EdgeInsets.only(bottom:12,top:1),
              height: 54,
              child: Center(

                child: TextField(
                    onTap: (){

                    },
                    controller: textEditingController,

                    decoration: InputDecoration(
                      hintText: LocalKeys.illbuy.tr(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,),
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey,),),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey,),),
                      // labelText: "Men sotib olmoqchiman",
                      prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                      suffixIcon: const Icon(Icons.mic,color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,)
                ),
              ),
            ),
          ),
          SliverFillRemaining(

            fillOverscroll: true,
            hasScrollBody: true,
            child: BlocBuilder<ForHomePageCubit, CubitHomePState>(  // cubit
              builder: (contextCubit, stateCubit) {

                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<SlidersBloc, SlidersState>(    // bloc
                  builder: (context, state) {
                    if(state is SlidersSuccseslState){

                      List<int> n =[]; n.clear(); int p=0;
                      state.modelTexno.data1?.listData?.forEach((element) {
                        n.add(p);
                        p++;
                      });

                      return CarouselSlider(
                        carouselController: carouselController,
                        options:  CarouselOptions(
                          viewportFraction: 0.97,
                          height: MediaQuery.of(context).size.height*0.23,
                          autoPlay: true,
                          enlargeFactor: 1.1,
                          scrollDirection:  Axis.horizontal,
                          onPageChanged: (index, reason) {
                            contextCubit.read<ForHomePageCubit>().indexSlider(index);
                          },
                          enlargeCenterPage: true,
                          disableCenter: false
                        ),
                        items:n.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return itemBulder_for_slider(context,i,state.modelTexno);
                            },
                          );
                        }).toList(),
                      );
                    }
                    if (state is SlidersInitialState){
                      return Center(child: LoadingAnimationWidget.twoRotatingArc(color: Colors.amber, size: 50),);
                    }
                    else {
                      return Center(child: Text("Error"),);
                    }

                },
                ), 
                      SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.03,
                  child:  DotsIndicator(
                position: stateCubit.indexSlider??0,
                decorator: const DotsDecorator(
                  activeColor: Colors.black,
                ),
                dotsCount: 7,
                  ),
                ) , 
                      BlocBuilder<SpecialbrandBloc, SpecialbrandState>(
                  builder: (context, state) {
                   if(state is SpecialbrandSuccessState){

                     return SizedBox(
                       width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height*0.08,
                       child: ListView.builder(itemBuilder: (context, index) {
                         return specialBrandsitem(context,index,state.modelSpecialBrands);
                         },
                         scrollDirection:Axis.horizontal,
                         itemCount: state.modelSpecialBrands.data?.dataList?.length??0,),
                     );
                   }
                   else if(state is SpecialbrandInitialState){
                     return Container();
                   }

                   else {
                     return const Center(child: Text('Error'),);
                   }

  },
), 
                      BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if(state is CategorySuccessState){
                      return SizedBox(
                        height: MediaQuery.of(context).size.height*0.16,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("   ${LocalKeys.category.tr()}",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                TextButton(onPressed: () {

                                },
                                    child: Text( "${LocalKeys.all.tr()}>",style: const TextStyle(fontSize: 14,color: Colors.grey)))
                              ],),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                return categorylisttem(context, index,state.modelCategory);
                              },itemCount: state.modelCategory.data?.data?.length??0,
                                scrollDirection: Axis.horizontal,
                              ),
                            )
                          ],),
                      );
                    }
                    else if(state is CategoryInitialState){
                      return Container();
                    }
                    else {
                      return const Center(child: Text("Error"),);
                    }
  },
),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Divider(color: Color(0xFFC2C2C1),),
                      ),
                      Padding(padding: const EdgeInsets.only(left: 10), 
                        child: Text(LocalKeys.newgoods.tr(),textAlign: TextAlign.start,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      ), 
                      BlocBuilder<GetProductCubitNews, GetProductState>(
                 builder: (context, state) {
                   if(state is GetProductSuccessState){
                     return Container(
                       margin: const EdgeInsets.only(left: 10),
                       width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height*0.31,
                       child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemBuilder:(context, index) {
                         return itemBuldForPageNews(context, index,state.modelProductsNews);
                       },
                         itemCount: state.modelProductsNews?.dataMap?.datalist?.length??0,
                       ),

                     );
                   }
                   else if(state is GetProductInitialState){
                     return Container();
                   }
                   else {return Center(child: Text("error"),);}

  },
), 
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Divider(color: Color(0xFFC2C2C1),),
                      ),
                      Padding(padding: const EdgeInsets.only(left: 10),
                        child: Text(LocalKeys.xitTovar.tr(),textAlign: TextAlign.start,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      ), 
                      BlocBuilder<GetProductXitCubit, GetProductXitState>(
                        builder: (context, state) {
                          if(state is GetProductXitSuccesslSate){
                            return Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.31,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder:(context, index) {
                                  return itemBuldForPageNews(context, index,state.modelProducts);
                                },
                                itemCount: state.modelProducts?.dataMap?.datalist?.length??0,
                              ),
                            );
                          }
                          else if(state is GetProductXitInitialState){
                            return Container();
                          }
                          else {
                            return const Center(child: Text("Error"),);}
                          },
                      ),
                      BlocBuilder<GetRecommendetCollectionCubit, GetRecommendetCollectionState>(
                        builder: (context, state) {
                          if(state is GetRecommendetCollectionSuccessState){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Divider(color: Color(0xFFC2C2C1),),
                                ),
                                Padding(padding: const EdgeInsets.only(left: 10),
                                  child: Text(state.modelRecommendedProduct!.dataLista?.list![0].name??'',textAlign: TextAlign.start,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height*0.31,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:(context, index) {
                                      return itemBuldForRecommended(context, index,state.modelRecommendedProduct,0);
                                    },
                                    itemCount: state.modelRecommendedProduct?.dataLista?.list?[0].products?.length??0,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Divider(color: Color(0xFFC2C2C1),),
                                ),
                                Padding(padding: const EdgeInsets.only(left: 10),
                                  child: Text(state.modelRecommendedProduct!.dataLista?.list![1].name??'',textAlign: TextAlign.start,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height*0.31,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:(context, index) {
                                      return itemBuldForRecommended(context, index,state.modelRecommendedProduct,1);
                                    },
                                    itemCount: state.modelRecommendedProduct?.dataLista?.list?[1].products?.length??0,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Divider(color: Color(0xFFC2C2C1),),
                                ),
                                Padding(padding: const EdgeInsets.only(left: 10),
                                  child: Text(state.modelRecommendedProduct!.dataLista?.list![2].name??'',textAlign: TextAlign.start,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height*0.31,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:(context, index) {
                                      return itemBuldForRecommended(context, index,state.modelRecommendedProduct,2);
                                    },
                                    itemCount: state.modelRecommendedProduct?.dataLista?.list?[2].products?.length??0,
                                  ),
                                ),
                              ],
                            );
                          }
                          else if(state is GetRecommendetCollectionInitialState){
                            return Container();
                          }
                          else {
                            return const Center(child: Text("Error"),);}
                        },
                      ),

                    ],),);
                },),
          ),],
      ),

      ),
    );

  }

}

