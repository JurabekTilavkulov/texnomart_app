import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import 'package:texnomart_app/ui/pages/card_page/card_page.dart';
import 'package:texnomart_app/ui/pages/catalog_page/catalog_page.dart';
import 'package:texnomart_app/ui/pages/order_page/oreder_page.dart';
import 'package:texnomart_app/ui/pages/profile_page/profile_page.dart';
import '../../../data/cubit/main_page_cubit/main_page_cubit.dart';
import '../../../data/utils/app_svg.dart';
import '../../../data/utils/local_keys.dart';
import '../home_page/home_page.dart';

class MainPage extends StatelessWidget {
  final int? idProduct;

  MainPage({this.idProduct});

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) => MainPageCubit(),
      child:
          BlocBuilder<MainPageCubit, MainPageState>(builder: (context, state) {
        return Scaffold(
            body: IndexedStack(
              index: state.index,
              children: [
                HomePage(),
                CatalogPage(),
                CardPage(),
                OrderPage(),
                ProfilePage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                context.read<MainPageCubit>().isIndex(value);
              },
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              selectedItemColor: Colors.black,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              selectedIconTheme: const IconThemeData(color: Colors.black),
              showSelectedLabels: true,
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              useLegacyColorScheme: true,
              currentIndex: state.index,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppSvg.home,
                      color: (state.index == 0) ? Colors.black : Colors.grey,
                    ),
                    label: LocalKeys.home.tr()),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppSvg.catalog,
                      color: (state.index == 1) ? Colors.black : Colors.grey,
                    ),
                    label: LocalKeys.catalog.tr()),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppSvg.savatcha,
                      color: (state.index == 2) ? Colors.black : Colors.grey,
                    ),
                    label: LocalKeys.card.tr()),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppSvg.buyurtma,
                      color: (state.index == 3) ? Colors.black : Colors.grey,
                    ),
                    label: LocalKeys.order.tr()),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppSvg.profil,
                      color: (state.index == 4) ? Colors.black : Colors.grey,
                    ),
                    label: LocalKeys.profile.tr()),
              ],
            ));
      }),
    );
  }
}
