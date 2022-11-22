import 'package:flutter/material.dart';
import 'package:my_account_book/core/models/case_model.dart';
import 'package:intl/intl.dart';

class DailyCase extends StatelessWidget {
  DailyCase({
    super.key,
    required this.caseModel,
  });
  List<CaseModel> caseModel;

  String getDay(String eng) {
    String day;
    if (eng == 'Sunday') {
      day = '일';
    } else if (eng == 'Monday') {
      day = '월';
    } else if (eng == 'Tuesday') {
      day = '화';
    } else if (eng == 'Wednesday') {
      day = '수';
    } else if (eng == 'Thursday') {
      day = '목';
    } else if (eng == 'Friday') {
      day = '금';
    } else {
      day = '토';
    }
    return day;
  }

  @override
  Widget build(BuildContext context) {
    double dailyIncome = 0;
    double dailyExpenses = 0;
    caseModel.sort((a, b) => a.time.compareTo(b.time));
    String day = getDay(DateFormat('EEEE').format(caseModel.first.time));

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
        Row(
          children: [
            Text('${caseModel.first.time.day} $day'),
            Expanded(
              child: Container(
                constraints: const BoxConstraints.expand(height: 30),
                alignment: Alignment.center,
                color: Colors.lime,
                child: Text(
                  "수입 : $dailyIncome 지출 : $dailyExpenses 합계 : ${dailyIncome - dailyExpenses}",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
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
