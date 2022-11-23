import 'package:flutter/material.dart';
import 'package:my_account_book/ui/widgets/add_case_widget.dart';

class AddCasePage extends StatelessWidget {
  const AddCasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                ),
                Text(
                  '가계부',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),

            //replace with our own icon data.
          ),
        ),
        centerTitle: true,
        title: const Text('데이터입력페이지'),
        foregroundColor: Colors.black,
      ),
      body: const AddCaseWidget(),
    );
  }
}
