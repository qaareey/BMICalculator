import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double result;
  const ResultScreen({super.key, required this.result});

  String intranslateResult() {
    if (result > 0 && result < 18)
      return 'You\'re Underweight 😊';
    else if (result > 18 && result < 25)
      return 'You\'re in shape (Normaly or Healthy Weight) 👌';
    else if (result > 25 && result < 30)
      return 'You\'re Overweight 😘';
    else
      return 'You are Obese 😒';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculatot'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            Expanded(
                child: ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      result.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      intranslateResult(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )),
            CustomButton(
              onPressed: () => Navigator.pop(context),
              title: 'Re-Calculate',
            )
          ],
        ));
  }
}
