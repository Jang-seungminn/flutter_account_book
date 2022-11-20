import 'package:flutter/material.dart';
import 'package:my_account_book/ui/pages/dashboard_page.dart';
import 'package:my_account_book/ui/pages/main_page.dart';
import 'package:my_account_book/ui/pages/setting_page.dart';
import 'package:my_account_book/ui/pages/statistics_page.dart';
import 'package:my_account_book/ui/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);
  late NavigationProvider _navigationProvider;

  List<BottomNavigationBarItem> bottomNavigationBar = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.dashboard),
      label: "${DateTime.now().month}",
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.account_box),
      label: "${DateTime.now().month} / ${DateTime.now().day}",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.abc),
      label: "My Account",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.abc),
      label: "Setting",
    ),
  ];

  List<Widget> pages = [
    const DashboardPage(),
    const MainPage(),
    const StatisticsPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    _navigationProvider = Provider.of<NavigationProvider>(context);
    return MaterialApp(
      home: Scaffold(
        body: pages.elementAt(_navigationProvider.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black,
          elevation: 0,
          items: bottomNavigationBar,
          currentIndex: _navigationProvider.currentIndex,
          onTap: (value) {
            _navigationProvider.changeCurrentIndex(value);
          },
        ),
      ),
    );
  }
}
