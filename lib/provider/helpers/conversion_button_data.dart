import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class ConversionButtonData with ChangeNotifier {
  TextEditingController controller = TextEditingController();
  String expression = '';
  String process = '';
  String inputResult = '';
  List<String> operators = ['×', '-', '+', '÷'];
  double expValue = 1;

  void buttonPressed({required String buttonText}) {
    switch (buttonText) {
      case 'C':
        clearPressed();
        break;
      case '(':
        bracketPressed(buttonText: buttonText);
        break;
      case ')':
        bracketPressed(buttonText: buttonText);
        break;
      default:
        if (controller.text != '' && controller.text.characters.last == ')') {
          process += '*' + buttonText;
        } else {
          process += buttonText;
        }

        if (controller.text.length == 1 &&
            controller.text.characters.last == '0') {
          replaceOperatorButton(buttonText: buttonText);
        } else {
          controller.text += buttonText;
        }
    }

    notifyListeners();
  }

  void operatorButtonPressed({required String buttonText}) {
    if (!operators.contains(controller.text.characters.last)) {
      process += buttonText;
      controller.text += buttonText;
    } else if (controller.text.characters.last != '+' && buttonText == '+') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (controller.text.characters.last == '+' && buttonText == '-') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (buttonText == '-' && controller.text.characters.last == '×' ||
        controller.text.characters.last == '÷' && buttonText == '-') {
      process += buttonText;
      controller.text += buttonText;
    } else if (controller.text.characters.last != '÷' && buttonText == '÷') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (buttonText == '×' && controller.text.characters.last != '×') {
      replaceOperatorButton(buttonText: buttonText);
    }

    notifyListeners();
  }

  void bracketPressed({required String buttonText}) {
    if (controller.text != '') {
      if (buttonText == '(') {
        if (!operators.contains(controller.text.characters.last) &&
            controller.text.characters.last != '(') {
          process += '*' + buttonText;
        } else {
          process += buttonText;
        }
      } else {
        process += buttonText;
      }
    } else {
      process += buttonText;
    }

    controller.text += buttonText;

    notifyListeners();
  }

  void replaceOperatorButton({required buttonText}) {
    process = process.replaceFirst(process.characters.last, buttonText,
        process.lastIndexOf(process.characters.last));
    controller.text = controller.text.replaceFirst(
        controller.text.characters.last,
        buttonText,
        controller.text.lastIndexOf(controller.text.characters.last));
  }

  void deleteCharacter() {
    if (controller.text != '0' && process != '0' && expression != '0') {
      if (controller.text.length == 1) {
        controller.text = '0';
        inputResult = '0';
        process = '0';
        expValue = 0;
      } else {
        controller.text =
            controller.text.substring(0, controller.text.length - 1);
        process = process.substring(0, process.length - 1);
      }
    }

    notifyListeners();
  }

  void clearPressed() {
    controller.text = '0';
    process = '0';
    inputResult = '0';
    expValue = 0;
    notifyListeners();
  }

  String getInputResult() {
    expression = process;

    expression = process;
    expression += ")" *
        ("\(".allMatches(expression).length -
            "\)".allMatches(expression).length);

    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll(',', '.');

    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();

      expValue = exp.evaluate(EvaluationType.REAL, contextModel);
      inputResult = expValue.toStringAsFixed(6);
      inputResult = inputResult.replaceAll(RegExp(r"([.]*000000)(?!.*\d)"), "");
    } catch (e) {}

    print(inputResult);
    return inputResult;
  }

  void thenNumpad() {
    controller.text = inputResult;
    notifyListeners();
  }
}
