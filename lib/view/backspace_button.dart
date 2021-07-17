import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/provider/conversion_data.dart';
import 'package:unit_converter/utils/constants.dart';

class BackSpaceButton extends StatelessWidget {
  const BackSpaceButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<ConversionData>(context, listen: false).deleteCharacter();
      },
      onLongPress: () {
        Provider.of<ConversionData>(context, listen: false).clearPressed();
      },
      child: Icon(
        Icons.backspace,
        size: 24.0,
        color: Colors.grey,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kOperatorColorDark),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Colors.grey[800]!,
        ),
      ),
    );
  }
}
