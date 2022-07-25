import 'package:bmi_calculator/helpers/constants.dart';
import 'package:bmi_calculator/screens/calculator_brain.dart';
import 'package:bmi_calculator/screens/resultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/helpers/reusableCard.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        backgroundColor: kBackground,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male ? kContain : kInactive,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    title: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female ? kContain : kInactive,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    title: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: ReusableCard(
            onPress: () {},
            color: kContain,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      // '120',
                      style: kHeight,
                    ),
                    Text(
                      'cm',
                      style: kSmallText,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xff8d8e98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayColor: Color(0x29eb1555)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 240,
                      // activeColor: Color(0xffeb1555),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                      onPress: () {},
                      color: kContain,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kHeight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              )
                            ],
                          )
                        ],
                      ))),
              Expanded(
                  child: ReusableCard(
                onPress: () {},
                color: kContain,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelStyle,
                    ),
                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    Text(
                      age.toString(),
                      style: kHeight,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RoundIconButton(
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                        icon: FontAwesomeIcons.minus,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                        icon: FontAwesomeIcons.plus,
                      )
                    ])
                  ],
                ),
              ))
            ],
          )),
          BottomButton(
              buttonTitle: 'CALCULATE',
              onPress: () {
                CalcuatorBrain calc =
                    new CalcuatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: calc.calculatorBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              }),
          // BottomButton(
          //   buttonTitle: "Calculate",
          //   onTap: () {
          //     CalcBrain calc = CalcBrain(height: height, weight: weight);
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => ResultPage(
          //           bmiResult:calc.calBMI(),
          //           resultText: calc.result(),
          //           interpretation: calc.bmiInterpretation(),
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
