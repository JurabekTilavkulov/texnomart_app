import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:texnomart_app/data/utils/app_routes.dart';
import 'data/bloc/language_bloc/language_bloc.dart';
import 'data/cubit/internet_cubits/get_news_cubit/get_news_cubit.dart';
import 'data/cubit/internet_cubits/get_product_cubit_news/get_product_cubit.dart';
import 'data/cubit/internet_cubits/get_product_cubit_xit/get_product_xit_cubit.dart';
import 'data/cubit/internet_cubits/get_recommended_cubit/get_recommendet_collection_cubit.dart';
import 'data/services/internet_service/net_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('uz'),
        Locale('ru'),
      ],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: const Locale('uz'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetProductCubitNews(NetService(Dio()))),
        BlocProvider(create: (context) => GetProductXitCubit(netService: NetService(Dio()))),
        BlocProvider(create: (context) => GetRecommendetCollectionCubit(NetService(Dio()))),
        BlocProvider(create: (context) => GetNewsCubit(NetService(Dio()))),
      ],

      child: BlocProvider(
        create: (context) => LanguageBloc(),
        child: BlocBuilder<LanguageBloc, Locale>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                //scaffoldBackgroundColor: const Color(0xFFfbc100),
                useMaterial3: true,
              ),
              initialRoute: AppRoutes.splashPage,
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}

