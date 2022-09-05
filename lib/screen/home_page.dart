import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/list_restaurant.dart';

import 'package:restaurant_app/widget/platform_widget.dart';
import 'package:restaurant_app/widget/styles.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [];

  Widget _buildForAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
    );
  }

  Widget _buildForIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _bottomNavBarItems,
        activeColor: thirdColor,
      ),
      tabBuilder: (context, index) {
        return _listWidget[index];
      },
    );
  }

  final List<Widget> _listWidget = const [
    ListRestaurant(),
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildForAndroid,
      iosBuilder: _buildForIos,
    );
  }
}
