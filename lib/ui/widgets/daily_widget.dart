import 'package:flutter/material.dart';
import 'package:my_account_book/core/models/case_model.dart';
import 'package:my_account_book/ui/components/daily_case_component.dart';

class DailyWidget extends StatelessWidget {
  DailyWidget({
    super.key,
    required this.currentYear,
    required this.currentMonth,
  });
  int currentYear;
  int currentMonth;

  @override
  Widget build(BuildContext context) {
    List<CaseModel> testModel = [
      CaseModel()
        ..income = 0
        ..expenses = 50000
        ..time = DateTime(2022, 11, 26, 22, 39),
      CaseModel()
        ..income = 5000
        ..expenses = 0
        ..time = DateTime(2022, 11, 26, 22, 12),
    ];

    List<CaseModel> testModel2 = [
      CaseModel()
        ..income = 5000
        ..expenses = 0
        ..time = DateTime(2022, 12, 21, 22, 12),
      CaseModel()
        ..income = 0
        ..expenses = 50000
        ..time = DateTime(2022, 12, 21, 22, 22),
    ];
    List<CaseModel> testModel3 = [
      CaseModel()
        ..income = 5000
        ..expenses = 0
        ..time = DateTime(2022, 10, 21, 22, 12),
      CaseModel()
        ..income = 0
        ..expenses = 50000
        ..time = DateTime(2022, 10, 21, 22, 22),
    ];
    List<DailyCase> dailyCase = [
      DailyCase(caseModel: testModel),
      DailyCase(caseModel: testModel2),
      DailyCase(caseModel: testModel3)
    ];

    // return Text('$currentMonth');
    return ListView.builder(
      shrinkWrap: false,
      itemCount: dailyCase.length,
      itemBuilder: (context, index) {
        if (dailyCase[index].caseModel[0].time.month == currentMonth &&
            dailyCase[index].caseModel[0].time.year == currentYear) {
          return dailyCase[index];
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
