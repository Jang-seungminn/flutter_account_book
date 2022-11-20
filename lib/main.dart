import 'package:flutter/material.dart';
import 'package:my_account_book/ui/providers/navigation_provider.dart';
import 'package:my_account_book/ui/root.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Root(),
    ),
  );
}
