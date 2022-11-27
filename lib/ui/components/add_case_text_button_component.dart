import 'package:flutter/material.dart';

class AddCaseTextButton extends StatelessWidget {
  AddCaseTextButton({
    super.key,
    required this.content,
    required this.textColor,
    required this.onPressed,
    required this.isSelected,
  });
  Color textColor;
  String content;
  Function(String, bool) onPressed;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    Color textColorWithOpacity = textColor.withOpacity(0.2);

    return Container(
      height: 40,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: textColor),
      ),
      child: TextButton(
        onPressed: () {
          isSelected = !isSelected;
          onPressed(content, isSelected);
        },
        style: ButtonStyle(
          backgroundColor: isSelected
              ? MaterialStateColor.resolveWith((states) => textColorWithOpacity)
              : null,
          overlayColor:
              MaterialStateColor.resolveWith((states) => textColorWithOpacity),
        ),
        child: Text(
          content,
          style: TextStyle(fontSize: 20, color: textColor),
        ),
      ),
    );
  }
}
