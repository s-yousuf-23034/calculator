import 'package:assignment3/provider/calculator.dart';
import 'package:assignment3/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<CalculatorProvider>(
    create: (context) => CalculatorProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        //primarySwatch: Colors.blue,
        // brightness: Brightness.light
      ),
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   primarySwatch: Colors.blue,
      // ),
      home: CalculatorScreen(),
    );
  }
}
