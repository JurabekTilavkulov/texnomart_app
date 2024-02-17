import 'package:flutter/cupertino.dart';

import '../../../data/models/model_news.dart';

Widget itemNewsHomePage(BuildContext context,int index,ModelNews? modelNews){
  return GestureDetector(
    onTap: () {

    },
    child: SizedBox(
      height: MediaQuery.of(context).size.height*0.28,
      width: MediaQuery.of(context).size.width*0.73,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Container(
          margin: const EdgeInsets.only(top: 5,right: 10),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*0.8,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
                image: NetworkImage(modelNews!.data!.list![index].src!),fit:BoxFit.fill)
          ),
        ),
        Text(modelNews.data!.list![index].publishDate!,style: const TextStyle(fontSize: 11),),
        Text(modelNews.data!.list![index].title!,maxLines: 2,overflow:TextOverflow.clip,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
      ],),
    ),
  );
}