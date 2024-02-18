import 'package:flutter/cupertino.dart';
import '../../ui/pages/card_page/card_page.dart';
import '../../ui/pages/catalog_page/catalog_page.dart';
import '../../ui/pages/choose_language_page/choose_language_page.dart';
import '../../ui/pages/detail_page/detail_page.dart';
import '../../ui/pages/home_page/home_page.dart';
import '../../ui/pages/main_page/main_page.dart';
import '../../ui/pages/order_page/oreder_page.dart';
import '../../ui/pages/profile_page/profile_page.dart';
import '../../ui/pages/splash_page/splash_page.dart';

class AppRoutes{
  static const String splashPage='/splashPage';
  static const String chooseLanguagePage='/chooseLanguagePage';
  static const String homePage='/homePage';
  static const String mainPage='/mainPage';
  static const String cardPage='/cardPage';
  static const String catalogPage='/catalogPage';
  static const String orderPage='/orderPage';
  static const String profilePage='/profilePage';
  static const String detailPage='/detailPage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch (settings.name){
      case AppRoutes.splashPage:return CupertinoPageRoute(builder: (context) => SplashPage(),);
      case AppRoutes.chooseLanguagePage:return CupertinoPageRoute(builder: (context) => const ChooseLanguagePage(),);
      case AppRoutes.homePage:return CupertinoPageRoute(builder: (context) =>  HomePage(),);
      case AppRoutes.mainPage:return CupertinoPageRoute(builder: (context) =>    MainPage(idProduct: settings.arguments as int),);// Null is not a suptype is int
      case AppRoutes.cardPage:return CupertinoPageRoute(builder: (context) =>   CardPage(),);
      case AppRoutes.catalogPage:return CupertinoPageRoute(builder: (context) =>  const CatalogPage(),);
      case AppRoutes.orderPage:return CupertinoPageRoute(builder: (context) =>  const OrderPage(),);
      case AppRoutes.profilePage:return CupertinoPageRoute(builder: (context) =>  const ProfilePage(),);
      case AppRoutes.detailPage:return CupertinoPageRoute(builder: (context) =>   DetailPage(id:settings.arguments as int ));
    }
    return null;
  }
}