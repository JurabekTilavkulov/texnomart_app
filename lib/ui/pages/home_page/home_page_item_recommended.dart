import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:texnomart_app/data/utils/app_svg.dart';
import '../../../data/models/model_recommended.dart';

Widget itemBuldForRecommended(BuildContext context,int index,ModelRecommendedProduct? modelRecommendedProduct,int n){
  return GestureDetector(
    onTap: () {

    },
    //modelProducts.dataMap!.datalist![index].name!
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(left:10,top: 5),
            width: MediaQuery.of(context).size.width*0.35,
            height: MediaQuery.of(context).size.height*0.18,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    top: 15,
                    width: MediaQuery.of(context).size.width*0.33,
                    //height:MediaQuery.of(context).size.height*0.22 ,
                    child: Image.network("${modelRecommendedProduct!.dataLista!.list![n].products![index].image}")),
                Positioned(
                  left: MediaQuery.of(context).size.width*0.29,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 20,
                        decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(blurRadius:1,color: Colors.grey)],
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppSvg.likeBlack),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 20,
                        decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(blurRadius:1,color: Colors.grey)],
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppSvg.compareBlack),
                      ),

                    ],
                  ),
                )
              ],
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.35,
          child: Text(modelRecommendedProduct.dataLista!.list![n].products![index].name!,maxLines: 2,overflow:TextOverflow.ellipsis,style: const TextStyle(fontSize: 12),),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AppSvg.star),
              SvgPicture.asset(AppSvg.star),
              SvgPicture.asset(AppSvg.star),
              SvgPicture.asset(AppSvg.star),
              SvgPicture.asset(AppSvg.star),
            ],),
        ),
        Container(
          padding: const EdgeInsets.only(top: 2,bottom: 2,left: 1,right: 1),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0x6BE8DFDF),
          ),
          child: Text(modelRecommendedProduct.dataLista!.list![n].products![index].axiomMonthlyPrice!,style: TextStyle(fontSize: 11),),
        ),
        Text("${modelRecommendedProduct.dataLista!.list![n].products![index].salePrice!} so'm",style: const TextStyle(fontWeight: FontWeight.bold),)

      ],),
  );
}