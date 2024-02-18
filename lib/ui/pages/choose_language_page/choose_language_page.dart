
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texnomart_app/data/utils/app_routes.dart';


import '../../../data/bloc/language_bloc/language_bloc.dart';

class ChooseLanguagePage extends StatelessWidget {
    const ChooseLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LanguageBloc, Locale>(
  builder: (context, state) {

    return Scaffold(

      backgroundColor:const Color(0xFFfbc100),
      body: SafeArea(

        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                InkWell(onTap: () async
                {
                  context.setLocale(const Locale('uz')); //tanlangan tilni xotirada saqlaydi
                  context.read<LanguageBloc>().add(ChangeLanguageEvent(const Locale("uz"))); // bloc da oz'gartirish uchun

                  Future.delayed(const Duration(seconds: 1),() {
                    Navigator.pushReplacementNamed(context, AppRoutes.mainPage,arguments: 0);
                  },);
                },
                  child: Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  height: MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:state!=const Locale("uz")? Colors.grey:const Color(0xFFfbc100)),
                  ),
                  child:  Center(child: Text("O'zbek",
                    style: TextStyle(color: state!= const Locale("uz")? Colors.black:const Color(0xFFfbc100)),)),
                ),),
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                InkWell(onTap: ()
                {
                  context.setLocale(const Locale("en"));
                  context.read<LanguageBloc>().add(ChangeLanguageEvent(const Locale("en")));

                  Future.delayed(const Duration(seconds: 1),() {
                    Navigator.pushReplacementNamed(context, AppRoutes.mainPage,arguments: 0);
                  },);
                },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:state!=const Locale("en")? Colors.grey:const Color(0xFFfbc100)),
                    ),
                    child:  Center(child: Text("English",
                      style: TextStyle(color: state!= const Locale("en")? Colors.black:const Color(0xFFfbc100)),)),
                  ),),
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                InkWell(onTap: ()
                {
                  context.setLocale(const Locale('ru'));
                  context.read<LanguageBloc>().add(ChangeLanguageEvent(const Locale("ru")));

                  Future.delayed(const Duration(seconds: 1),() {

                    Navigator.pushReplacementNamed(context, AppRoutes.mainPage,arguments: 0);
                  },);
                },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:state!=const Locale("ru")? Colors.grey:const Color(0xFFfbc100)),
                    ),
                    child:  Center(child: Text("Русский",
                      style: TextStyle(color: state!= const Locale("ru")? Colors.black:const Color(0xFFfbc100)),)),
                  ),)
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
