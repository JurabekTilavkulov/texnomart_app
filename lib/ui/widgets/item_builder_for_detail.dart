import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import 'package:texnomart_app/data/utils/app_svg.dart';

import '../../data/cubit/cubit_helper/cubit_helper.dart';
import '../../data/models/model_good_by_id.dart';

Widget itemBuilderForDetail(BuildContext context,int index,List<ModelProductsById> list){
  return BlocBuilder<CubitHelper, CubitHelperState>(
  builder: (context, state) {

    return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*0.22,
    child: Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.2,
          height: MediaQuery.of(context).size.height*0.16,
          child: Image.network(list[index].smallImage!),
        ),
        Container(
          padding: const EdgeInsets.only(left: 5),
          width: MediaQuery.of(context).size.width*0.48,
          height: MediaQuery.of(context).size.height*0.20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(list[index].name!,style: const TextStyle(fontSize: 12),overflow: TextOverflow.clip,),
              Text("${list[index].salePrise} so'm",style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0x6bdcd8d8)
                ),
                child: Center(child: Text(list[index].monthlyPrice!),),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.height*0.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:  Border.all(color: const Color(0x6bdcd8d8)),

                  ),
                child: Center(child: Row(
                  children: [
                    IconButton(onPressed: () {

                    },
                    icon: const Icon(Icons.remove,size: 18,),),
                    Text("1",style: const TextStyle(fontWeight: FontWeight.bold)),
                    IconButton(onPressed: () {

                    },
                      icon: const Icon(Icons.add,size: 18,),),
                  ],
                ),),
              )

            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Checkbox(value: false, onChanged: (value) {

          },),
          Row(children: [
            IconButton(onPressed: () {

            },icon: SvgPicture.asset(AppSvg.likeBlack),),
            IconButton(onPressed: () {
              context.read<CubitHelper>().removeProduct(list[index]);
            },icon: const Icon(Icons.delete_outlined),),
          ],)
        ],),
      ],),
  );
  },
);
}