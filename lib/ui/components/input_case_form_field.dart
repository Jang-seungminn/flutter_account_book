import 'package:flutter/material.dart';

class InputCaseFormField extends StatefulWidget {
  InputCaseFormField({
    super.key,
    required this.textColor,
    required this.onSaved,
  });
  Color textColor;
  Function onSaved;
  @override
  State<InputCaseFormField> createState() => _InputCaseFormFieldState();
}

class _InputCaseFormFieldState extends State<InputCaseFormField> {
  String selectedDateString =
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
  String inputDateTime = "";
  String inputHistory = "";

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    void showDatePickerPop() {
      Future<DateTime?> selectedDate = showDatePicker(
        context: context,
        initialDate: DateTime.now(), //초기값
        firstDate: DateTime(2020), //시작일
        lastDate: DateTime(2023), //마지막일
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark(), //다크 테마
            child: child!,
          );
        },
      );

      selectedDate.then((dateTime) {
        if (dateTime == null) {
          return;
        }

        setState(() {
          selectedDateString =
              '${dateTime.year}-${dateTime.month}-${dateTime.day}';
        });
      });
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          renderTextFormField(
            label: '날짜',
            onSaved: (newValue) {
              inputDateTime = newValue;
            },
            validator: (value) {
              return null;
            },
            color: widget.textColor,
            onTap: showDatePickerPop,
            text: selectedDateString,
          ),
          renderTextFormField(
            label: '내역',
            onSaved: (newValue) {
              inputHistory = newValue;
            },
            validator: (value) {
              return null;
            },
            color: widget.textColor,
            onTap: () {},
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                print('$inputDateTime  $inputHistory');
                widget.onSaved();
              }
            },
            child: const Text(
              '저장',
            ),
          )
        ],
      ),
    );
  }

  renderTextFormField({
    required String label,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
    required Color color,
    Function? onTap,
    String? text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 5, top: 5, left: 20, right: 10),
            child: TextFormField(
              onTap: () {
                onTap!();
              },
              controller: TextEditingController(text: text),
              style: TextStyle(color: color),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: color, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: color, width: 2),
                ),
              ),
              onSaved: onSaved,
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
