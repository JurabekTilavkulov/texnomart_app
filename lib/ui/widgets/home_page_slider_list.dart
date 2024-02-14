
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/models/model_texno.dart';

Widget itemBulder_for_slider(BuildContext context,int index,ModelTexno modelTexno){
  return Container(
      width: MediaQuery.of(context).size.width*08,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(blurRadius: 1),],
          color: index%2==0?Colors.amber:const Color(0xFFFAE458),
          image: DecorationImage(
              fit: BoxFit.fill,
              isAntiAlias: true,

              image: NetworkImage(modelTexno.data1!.listData![index].imageMobileWeb??'https://cdn4.iconfinder.com/data/icons/picture-sharing-sites/32/No_Image-1024.png')
          )
      ),

  );
}