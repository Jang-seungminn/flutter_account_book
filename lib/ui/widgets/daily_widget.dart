import 'package:flutter/material.dart';
import 'package:my_account_book/core/models/case_model.dart';
import 'package:my_account_book/ui/components/daily_case_component.dart';

class DailyWidget extends StatelessWidget {
  const DailyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DailyCase(
      caseModel: [
        CaseModel()
          ..income = 0
          ..expenses = 50000
          ..time = DateTime(2022, 11, 20, 22, 39),
        CaseModel()
          ..income = 5000
          ..expenses = 0
          ..time = DateTime(2022, 11, 20, 22, 12),
        CaseModel()
          ..income = 3000
          ..expenses = 0
          ..time = DateTime(2022, 11, 20, 22, 24),
        CaseModel()
          ..income = 0
          ..expenses = 50000
          ..time = DateTime(2022, 11, 20, 22, 22),
      ],
      // income: const [30000, 5000],
      // expenses: const [50000, 3000],
      // time: [
      //   DateTime(2022, 11, 20, 22, 39),
      //   DateTime(2022, 11, 20, 22, 57),
      //   DateTime(2022, 11, 20, 22, 23),
      //   DateTime(2022, 11, 20, 22, 40),
      // ],
    );
  }
}
