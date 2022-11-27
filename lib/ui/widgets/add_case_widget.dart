import 'package:flutter/material.dart';
import 'package:my_account_book/ui/components/add_case_text_button_component.dart';
import 'package:my_account_book/ui/components/input_case_form_field.dart';

enum SeletedCaseType { INCOME, EXPENSES, TRANSFER }

class AddCaseWidget extends StatefulWidget {
  const AddCaseWidget({super.key});

  @override
  State<AddCaseWidget> createState() => _AddCaseWidgetState();
}

class _AddCaseWidgetState extends State<AddCaseWidget> {
  SeletedCaseType seletedCaseType = SeletedCaseType.INCOME;

  void changeCaseType(String content, bool isSelected) {
    setState(() {
      if (content == "수입" && isSelected) {
        seletedCaseType = SeletedCaseType.INCOME;
      } else if (content == "지출" && isSelected) {
        seletedCaseType = SeletedCaseType.EXPENSES;
      } else if (content == "이체" && isSelected) {
        seletedCaseType = SeletedCaseType.TRANSFER;
      }
    });
  }

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
              onPressed: changeCaseType,
              isSelected: seletedCaseType == SeletedCaseType.INCOME,
            ),
            AddCaseTextButton(
              textColor: Colors.red,
              content: '지출',
              onPressed: changeCaseType,
              isSelected: seletedCaseType == SeletedCaseType.EXPENSES,
            ),
            AddCaseTextButton(
              textColor: Colors.orange,
              content: '이체',
              onPressed: changeCaseType,
              isSelected: seletedCaseType == SeletedCaseType.TRANSFER,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        InputCaseFormField(
          textColor: getSeletedColor(seletedCaseType),
          onSaved: onSaved,
        )
      ],
    );
  }

  void onSaved() {
    Navigator.pop(context);
  }

  Color getSeletedColor(SeletedCaseType seletedCaseType) {
    switch (seletedCaseType) {
      case SeletedCaseType.INCOME:
        return Colors.blue;

      case SeletedCaseType.EXPENSES:
        return Colors.red;

      case SeletedCaseType.TRANSFER:
        return Colors.orange;

      default:
        return Colors.black;
    }
  }
}
