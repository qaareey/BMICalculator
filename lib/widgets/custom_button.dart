import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String? title;
  const CustomButton({super.key, required this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // onPressed: () {
      //   _goToResultScreen();
      // },
      //onPressed: () => _goToResultScreen(),
      onPressed: onPressed,
      child: Text(
        title ?? 'Calculate',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      fillColor: kBottomContainerColour,
      constraints: BoxConstraints.tightFor(
        width: double.infinity,
        height: 56,
      ),
    );
  }
}
