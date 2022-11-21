import 'package:flutter/material.dart';

class MonthSelector extends StatefulWidget {
  MonthSelector({super.key, required this.callback});
  Function callback;

  int _selectedYear = DateTime.now().year;
  int get seletedYear => _selectedYear;
  int _selectedMonth = DateTime.now().month;
  int get selectedMonth => _selectedMonth;
  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              widget._selectedMonth--;

              if (widget._selectedMonth == 0) {
                widget._selectedYear--;
                widget._selectedMonth = 12;
              }
              widget.callback(() {
                return;
              });
            });
          },
          iconSize: 30,
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
          ),
        ),
        Text(
          "${widget._selectedYear} 년 ${widget._selectedMonth} 월",
          style: const TextStyle(fontSize: 20),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget._selectedMonth++;
              if (widget._selectedMonth == 13) {
                widget._selectedYear++;
                widget._selectedMonth = 1;
              }
              widget.callback(() {
                return;
              });
            });
          },
          iconSize: 30,
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_circle_right_outlined,
          ),
        )
      ],
    );
  }
}
