import 'package:flutter/material.dart';
import 'package:unit_converter/utils/constants.dart';
import 'backspace_button.dart';
import 'button.dart';
import 'operator_button.dart';

class Numpad extends StatelessWidget {
  const Numpad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColorDark,
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return GridView.count(
            crossAxisCount: 4,
            childAspectRatio:
                constraints.maxWidth / constraints.maxHeight / 0.8,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: kConversionButtonNames.map<Widget>((e) {
              switch (e) {
                case '÷':
                  return OperatorButton(buttonText: e);
                case '×':
                  return OperatorButton(buttonText: e);
                case '-':
                  return OperatorButton(buttonText: e);
                case '+':
                  return OperatorButton(buttonText: e);
                case '⌫':
                  return BackSpaceButton();
                default:
                  return Button(buttonText: e);
              }
            }).toList(),
          );
        },
      ),
    );
  }
}
