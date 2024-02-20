import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:texnomart_app/data/services/DB/date_base_service.dart';
import 'package:texnomart_app/data/utils/app_routes.dart';
import 'data/bloc/internet_blocs/detail_bloc/detail_bloc.dart';
import 'data/bloc/language_bloc/language_bloc.dart';
import 'data/cubit/cubit_helper/cubit_helper.dart';
import 'data/services/internet_service/net_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseservice().initialDB();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("tovarlar");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider(create: (context) => CubitHelper(dataBaseservice: DataBaseservice())),
        BlocProvider(create: (context) => DetailBloc(NetService(Dio()))),
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

