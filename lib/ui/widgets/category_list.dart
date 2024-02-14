import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../data/models/model_category.dart';

Widget categorylisttem(BuildContext context, int index, ModelCategory modelCategory){
  return   InkWell(
    onTap: (){
      print("botton N:${index}");
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
           margin: const EdgeInsets.only(left: 5,right: 5),
          width: MediaQuery.of(context).size.width*0.25,
          height: MediaQuery.of(context).size.height*0.07,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(blurRadius: 1,offset:Offset(1,1),color: Colors.grey),
                BoxShadow(blurRadius: 1,offset:Offset(-1,1),color: Colors.grey),
              ],
              borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.network(modelCategory.data!.data?[index].image??
              'https://cdn4.iconfinder.com/data/icons/picture-sharing-sites/32/No_Image-1024.png',
            //fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(height: 5,),
        Text("${modelCategory.data?.data?[index].title}",style: const TextStyle(fontSize: 10),)
      ],
    ),
  );
}