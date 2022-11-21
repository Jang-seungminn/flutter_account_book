import 'package:flutter/material.dart';
import 'package:my_account_book/core/models/case_model.dart';

class DailyCase extends StatelessWidget {
  DailyCase({
    super.key,
    // required this.income,
    // required this.expenses,
    // required this.time,
    required this.caseModel,
  });
  // List income;
  // List expenses;
  // List<DateTime> time;
  List<CaseModel> caseModel;

  @override
  Widget build(BuildContext context) {
    double dailyIncome = 0;
    double dailyExpenses = 0;
    caseModel.sort((a, b) => a.time.compareTo(b.time));

    for (var i = 0; i < caseModel.length; i++) {
      if (caseModel[i].income != 0) {
        dailyIncome += caseModel[i].income;
      }

      if (caseModel[i].expenses != 0) {
        dailyExpenses += caseModel[i].expenses;
      }
    }
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints.expand(height: 30),
          alignment: Alignment.center,
          color: Colors.lime,
          child: Text(
            "수입 : $dailyIncome 지출 : $dailyExpenses",
            style: const TextStyle(fontSize: 18),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: caseModel.length,
          itemBuilder: ((context, index) {
            return SizedBox(
              height: 50,
              child: Center(
                child: Text(
                    "${caseModel[index].time} : ${caseModel[index].income} : ${caseModel[index].expenses}"),
              ),
            );
          }),
        ),
      ],
    );
  }
}
