import 'package:bmi_calculator/componants/card_data.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'componants/my_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender? selectedGender;
  int height = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kActiveColor
                      : kInActiveColor,
                  child: CardData(
                    title: 'MALE',
                    icon: FontAwesomeIcons.mars,
                  ),
                ),
                MyCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? kActiveColor
                      : kInActiveColor,
                  child: CardData(
                    title: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                  ),
                ),
              ],
            ),
          ),
          MyCard(
            color: kInActiveColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height'.toUpperCase(),
                  style: kTitleTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kTitleTextStyle,
                    ),
                  ],
                ),
                Slider(
                    max: 220,
                    min: 120,
                    value: height.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    })
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyCard(
                  color: kActiveColor,
                ),
                MyCard(
                  color: kActiveColor,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 16),
            alignment: Alignment.center,
            color: Colors.green,
            height: 80,
            width: double.infinity,
            child: Text(
              'CALCULATE',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

enum Gender { male, female }
