import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_contact/ui/menu/main_provider.dart';
import 'package:task_contact/ui/pages/add_page.dart';
import 'package:task_contact/ui/pages/category/category_page.dart';
import 'package:task_contact/ui/pages/category/category_provider.dart';
import 'package:task_contact/ui/pages/home_page.dart';
import 'package:task_contact/ui/pages/profile_page.dart';
import 'package:task_contact/ui/pages/search_page.dart';
import 'package:task_contact/utils/colors.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: IndexedStack(
          index: context.watch<MainModel>().index,
          children:  [
        const HomePage(),
        ChangeNotifierProvider(create: (_) => CategoryModel(),
          child: const CategoryPage(),),
        const AddPage(),
        const SearchPage(),
        const ProfilePage()
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex:context.watch<MainModel>().index,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) {
            context.read<MainModel>().onChangeTab(value);
            // context.read<MainModel>().changeIndex(value);
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/ic_home.svg',
                  color: context.watch<MainModel>().index==0?selectedMenuItemColor:unSelectedMenuItemColor,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/ic_category.svg',
                    color: context.watch<MainModel>().index==1?selectedMenuItemColor:unSelectedMenuItemColor
                ),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/ic_add.svg',
                    color: context.watch<MainModel>().index==2?selectedMenuItemColor:unSelectedMenuItemColor),
                label: 'Add'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/ic_search.svg',
                    color: context.watch<MainModel>().index==3?selectedMenuItemColor:unSelectedMenuItemColor),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/ic_profile.svg',
                    color: context.watch<MainModel>().index==4?selectedMenuItemColor:unSelectedMenuItemColor),
                label: 'Profile'),
          ]),
    ));
  }
}
