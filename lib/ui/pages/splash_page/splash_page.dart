import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import 'package:texnomart_app/data/utils/app_routes.dart';

import '../../../data/bloc/splash_bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
   SplashPage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
  create: (context) => SplashBloc()..add(SplashLoadedEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        // listener ishlatsak return kk bo'lmaydi
        listener: (context, state) {
          if(state is SplashLoadedState){
            Navigator.pushReplacementNamed(context, AppRoutes.chooseLanguagePage);
          }
          },
        child: Scaffold(
          backgroundColor:const Color(0xFFfbc100),
          body: SafeArea(child: Container(
            color: Color(0xFFfbc100),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset('assets/svg/tm-medium.d0722d2.svg',height: 40,),
                  SizedBox(height:MediaQuery.of(context).size.height*0.4),
                  CircularProgressIndicator(color: Colors.white),
                  SizedBox(height: MediaQuery.of(context).size.height*0.05),
                ],
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}
