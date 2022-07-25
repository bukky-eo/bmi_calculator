import 'package:flutter/material.dart';
import 'package:bmi_calculator/helpers/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function() onPress;
  const ReusableCard({
    Key? key,
    this.color = kContain,
    required this.cardChild,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: color),
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  final IconData icon;
  final String title;
  const IconContent({
    Key? key,
    this.title = 'MALE',
    this.icon = FontAwesomeIcons.mars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(title, style: kLabelStyle)
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final Function() onPressed;
  const RoundIconButton({Key? key, required this.onPressed, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: kTextColor,
      ),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}

class BottomButton extends StatelessWidget {
  final Function() onPress;
  final String buttonTitle;
  const BottomButton(
      {Key? key, required this.onPress, required this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(child: Text(buttonTitle)),
        color: kBottomColor,
        padding: EdgeInsets.only(bottom: 10.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
