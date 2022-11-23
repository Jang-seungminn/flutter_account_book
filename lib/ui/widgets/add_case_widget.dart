import 'package:flutter/material.dart';
import 'package:my_account_book/ui/components/add_case_text_button_component.dart';

enum SeletedCaseType { INCOME, EXPENSES, TRANSFER }

class AddCaseWidget extends StatelessWidget {
  const AddCaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AddCaseTextButton(
              textColor: Colors.blue,
              content: '수입',
            ),
            AddCaseTextButton(
              textColor: Colors.red,
              content: '지출',
            ),
            AddCaseTextButton(
              textColor: Colors.orange,
              content: '이체',
            ),
          ],
        )
      ],
    );
  }
}
