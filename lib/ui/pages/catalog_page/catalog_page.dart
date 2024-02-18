import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:texnomart_app/data/utils/app_svg.dart';
import 'package:texnomart_app/data/utils/local_keys.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Center(
          child: Container(
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.05,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffe5eaf6)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            const Icon(Icons.search,color: Colors.grey,),
            Text(LocalKeys.illbuy.tr(),style: const TextStyle(color: Colors.grey,fontSize: 16),),
            const Icon(Icons.mic_none,color: Colors.grey,),
          ],),
        ),
      ),
    ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.smartfonlar,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.smartphonesgadgets.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.komputerT,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Computer.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.ofice,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Office.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.oshxona,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Kitchen.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.uyUchun,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Household.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.avtomobil,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Goods.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.iqlim,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Climate.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.televizor,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.telecards.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.audio,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Audio.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.gozallik,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Health.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.bolalar,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Products.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.sport,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Sports.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.oyinKonsil,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Game.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.maishiy,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Household_goods.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  SvgPicture.asset(AppSvg.aksiya,height:MediaQuery.of(context).size.height*0.045 ),
                  const SizedBox(width: 5,),
                  Text(LocalKeys.Promotions.tr(),style: const TextStyle(fontSize: 17),)
                ],),
                SvgPicture.asset(AppSvg.right,height:MediaQuery.of(context).size.height*0.03)
              ],),
            ),
          ),

        ],
      ),
    );
  }
}
