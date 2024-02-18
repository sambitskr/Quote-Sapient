import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:quote_of_the_day/pages/favourites.dart';
import 'package:quote_of_the_day/pages/home.dart';

class HiddenDrawerPage extends StatefulWidget {
  const HiddenDrawerPage({super.key});

  @override
  State<HiddenDrawerPage> createState() => _HiddenDrawerPageState();
}

class _HiddenDrawerPageState extends State<HiddenDrawerPage> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Home',
          baseStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          selectedStyle: TextStyle(),
        ),
        HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Favourites',
          baseStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          selectedStyle: TextStyle(),
        ),
        FavouritePage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        backgroundColorMenu: Color.fromRGBO(176, 217, 177, 1),
        screens: _pages,
        initPositionSelected: 0,
        backgroundColorAppBar: Color.fromRGBO(97, 130, 100, 1));
  }
}
