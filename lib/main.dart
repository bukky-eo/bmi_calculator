import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

import 'helpers/constants.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kBackground,
        scaffoldBackgroundColor: kBackground,
      ),
      home: InputPage(),
    );
  }
}
