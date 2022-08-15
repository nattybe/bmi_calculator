import 'package:ff_st/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'thycards.dart';
import 'resultsPage.dart';

const kactiveCardColor = Color(0xff111328);
const kinactiveCardColor = Color.fromARGB(255, 63, 64, 71);
const klabletextstyle = TextStyle(fontSize: 18.0, color: Color(0xff8d8e98));
const kNumberTextStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 50.0);

enum Gender { male, female, non }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected = Gender.non;
  int height = 180;
  int weight = 56;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                //Male Card******************************************************************
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // print('ma');
                      setState(() {
                        selected = Gender.male;
                      });
                    },
                    child: ClickDetector(
                      onPress: () {
                        setState(() {
                          selected = Gender.male;
                        });
                      },
                      color: selected == Gender.male
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      child: ReusableCard(
                        icon: Icons.male,
                        labelText: 'MALE',
                      ),
                    ),
                  ),
                ),
                //Female Card******************************************************************
                Expanded(
                  child: ClickDetector(
                    onPress: () {
                      setState(() {
                        selected = Gender.female;
                      });
                    },
                    color: selected == Gender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    child: ReusableCard(
                      icon: Icons.female,
                      labelText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Height**************************************************************************
          Expanded(
            child: thycontainer(
              thyColor: kactiveCardColor,
              thyChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: klabletextstyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(
                        'cm',
                        style: klabletextstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color.fromARGB(255, 63, 64, 71),
                      thumbColor: Color(0xffeb1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x29eb1555),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 250,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: thycontainer(
                    thyColor: kactiveCardColor,
                    thyChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: klabletextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: Icons.exposure_minus_1),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: Icons.plus_one),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: thycontainer(
                    thyColor: kactiveCardColor,
                    thyChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: klabletextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: Icons.exposure_minus_1),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: Icons.plus_one),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottumButton(
            buttonTitlle: 'Caculate',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      number: calc.calulateBMI(),
                      text: calc.getResult(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
