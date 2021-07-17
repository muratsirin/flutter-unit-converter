import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/provider/conversion_data.dart';
import 'package:unit_converter/utils/constants.dart';

class Button extends StatelessWidget {
  final String buttonText;
  const Button({
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (buttonText != 'OK') {
          Provider.of<ConversionData>(context, listen: false)
              .buttonPressed(buttonText: buttonText);
        } else {
          Navigator.pop(context);
        }
      },
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 24.0,
          color: buttonText == 'OK' ? kEqualButtonColor : Colors.white,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          buttonText == 'OK'
              ? CircleBorder(
                  side: BorderSide(
                    color: kEqualButtonColor,
                  ),
                )
              : CircleBorder(),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          kPrimaryColorDark,
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Colors.grey[800]!,
        ),
      ),
    );
  }
}
