
import 'package:flutter/material.dart';
import 'package:texnomart_app/data/models/model_special_brands.dart';

Widget specialBrandsitem(BuildContext context, int index, ModelSpecialBrands modelSpecialBrands){
  return Row(
    children: [
      const SizedBox(width: 10,),
      InkWell(
        onTap: (){
          print("botton N:${index}");
        },
        child: Container(
          //padding: const EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
          margin: const EdgeInsets.only(top: 6,bottom: 6,left: 5,right: 5),
          width: MediaQuery.of(context).size.width*0.35,
          height: MediaQuery.of(context).size.height*0.045,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(blurRadius: 1,offset:Offset(1,1),color: Colors.grey),
              BoxShadow(blurRadius: 1,offset:Offset(-1,1),color: Colors.grey),

            ],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.contain,
              isAntiAlias: true,
              image: NetworkImage(modelSpecialBrands.data!.dataList?[index].image??'https://cdn4.iconfinder.com/data/icons/picture-sharing-sites/32/No_Image-1024.png',scale: 0.1 )
            )
          ),
        ),
      ),
    ],
  );
}