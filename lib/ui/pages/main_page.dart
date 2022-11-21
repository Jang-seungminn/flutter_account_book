import 'package:flutter/material.dart';
import 'package:my_account_book/ui/components/month_selector_component.dart';
import 'package:my_account_book/ui/widgets/daily_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late MonthSelector monthSelector;
  late List<Widget> tabs;
  int selectedYear = 0;
  int selectedMonth = 0;

  changedMonth(Function func) {
    setState(() {
      func();
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    monthSelector = MonthSelector(
      callback: changedMonth,
    );
    tabs = [
      const Text("daliy"),
      const Text("weekly"),
      const Text("monthly"),
      const Text("sammary"),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          monthSelector,
          TabBar(
            controller: _tabController,
            tabs: tabs,
            indicator: const BoxDecoration(
              gradient: LinearGradient(
                //배경 그라데이션 적용
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.blueAccent,
                  Colors.pinkAccent,
                ],
              ),
            ),
            labelPadding: const EdgeInsets.all(8),
            labelColor: Colors.black,
            labelStyle: const TextStyle(fontSize: 15),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                    child: DailyWidget(
                  currentMonth: monthSelector.selectedMonth,
                )),
                const Center(child: Text("weekly")),
                const Center(child: Text("monthly")),
                const Center(child: Text("sammary")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
