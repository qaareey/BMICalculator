import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result.dart';
import 'package:bmi_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

enum Gender {
  male,
  female,
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 180;
  int weight = 60;
  int age = 20;
  //int selectedGender = 1; // 1 male 2 female
  Gender selectedGender = Gender.male;

  void _goToResultScreen() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return ResultScreen();
    // }));
    double _result = weight / pow(height / 100, 2);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          result: _result,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    selected: selectedGender == Gender.male ? true : false,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      title: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    selected: selectedGender == Gender.female ? true : false,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      title: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.round().toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: kBottomContainerColour,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 16,
                        )),
                    child: Slider(
                      value: height,
                      min: 10,
                      max: 310,
                      onChanged: (newVal) {
                        setState(() {
                          height = newVal;
                          print(height);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'kg',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              iconData: Icons.remove,
                              onPressed: () => setState(() {
                                if (weight > 5) {
                                  weight--;
                                }
                              }),
                              //print('button remove clicked');
                            ),
                            SizedBox(width: 10),
                            RoundButton(
                              iconData: Icons.add,
                              onPressed: () => setState(() => weight++),
                              // print('button add clicked');
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$age',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'yrs',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              iconData: Icons.remove,
                              onPressed: () {
                                //print('button remove clicked');
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundButton(
                              iconData: Icons.add,
                              onPressed: () {
                                //print('button add clicked');
                                setState(() {
                                  if (age >= 1 && age <= 119) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(onPressed: _goToResultScreen),
        ],
      ),
    );
  }
}
