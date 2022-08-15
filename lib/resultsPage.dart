import 'package:flutter/material.dart';
import 'input_page.dart';
import 'thycards.dart';
import 'calculator_brain.dart';

class ResultPage extends StatelessWidget {
  final String text;
  final String number;

 ResultPage({required this.text,required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: thycontainer(
              thyColor: kactiveCardColor,
              thyChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.lightGreen,
                    ),
                  ),
                  Text(
                    number,
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottumButton(
              buttonTitlle: 'Re calulate',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InputPage();
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
