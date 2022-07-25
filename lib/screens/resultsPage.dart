import 'package:bmi_calculator/helpers/constants.dart';
import 'package:bmi_calculator/helpers/reusableCard.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation})
      : super(key: key);
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBackground,
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              child: Text('Your Results',
                  style: kHeight, textAlign: TextAlign.center),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kInactive,
              onPress: () {},
              cardChild: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 25,
                          backgroundColor: Colors.green),
                    ),
                    Text(
                      bmiResult,
                      style: kHeight,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kLabelStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            onPress: () => Navigator.pop(context),
            buttonTitle: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
