import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unit_converter/model/conversion.dart';
import 'package:unit_converter/provider/helpers/conversion_button_data.dart';
import 'package:unit_converter/provider/helpers/conversion_list.dart';
import 'package:unit_converter/view/unit_screen.dart';

class ConversionData extends ConversionButtonData with ConversionList {
  String resultValue = '';

  Map<String, String> selectedItemLength = {
    'Item': 'Metre',
    'ItemAbbreviation': 'm'
  };
  Map<String, String> selectedItemArea = {
    'Item': 'Metrekare',
    'ItemAbbreviation': 'm2'
  };
  Map<String, String> selectedItemWeight = {
    'Item': 'Kilogram',
    'ItemAbbreviation': 'kg'
  };
  Map<String, String> selectedItemVolume = {
    'Item': 'Metreküp',
    'ItemAbbreviation': 'm3'
  };
  Map<String, String> selectedItemTemperature = {
    'Item': 'Santigrat',
    'ItemAbbreviation': 'C'
  };
  Map<String, String> selectedItemCooking = {
    'Item': 'mililitre',
    'ItemAbbreviation': 'mL'
  };

  List<Tab> unitTopBarList = [
    Tab(
      icon: Icon(FontAwesomeIcons.rulerHorizontal),
      text: 'Uzunluk',
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.chartArea),
      text: 'Alan',
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.weightHanging),
      text: 'Kütle',
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.cube),
      text: 'Hacim',
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.temperatureHigh),
      text: 'Sıcaklık',
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.utensils),
      text: 'Pişirme',
    ),
  ];

  List<UnitScreen> unitScreenList() {
    List<UnitScreen> unitScreenItems = [
      UnitScreen(
        conversion: length,
        selectedItem: selectedItemLength['Item']!,
        selectedItemAbbreviation: selectedItemLength['ItemAbbreviation']!,
      ),
      UnitScreen(
        conversion: area,
        selectedItem: selectedItemArea['Item']!,
        selectedItemAbbreviation: selectedItemArea['ItemAbbreviation']!,
      ),
      UnitScreen(
        conversion: weight,
        selectedItem: selectedItemWeight['Item']!,
        selectedItemAbbreviation: selectedItemWeight['ItemAbbreviation']!,
      ),
      UnitScreen(
        conversion: volume,
        selectedItem: selectedItemVolume['Item']!,
        selectedItemAbbreviation: selectedItemVolume['ItemAbbreviation']!,
      ),
      UnitScreen(
        conversion: temperature,
        selectedItem: selectedItemTemperature['Item']!,
        selectedItemAbbreviation: selectedItemTemperature['ItemAbbreviation']!,
      ),
      UnitScreen(
        conversion: cooking,
        selectedItem: selectedItemCooking['Item']!,
        selectedItemAbbreviation: selectedItemCooking['ItemAbbreviation']!,
      ),
    ];

    return unitScreenItems;
  }

  void setSelectedItem({
    required String unitName,
    required String unitAbbreviation,
    required List<Conversion> conversion,
  }) {
    if (conversion == length) {
      selectedItemLength['Item'] = unitName;
      selectedItemLength['ItemAbbreviation'] = unitAbbreviation;
    } else if (conversion == area) {
      selectedItemArea['Item'] = unitName;
      selectedItemArea['ItemAbbreviation'] = unitAbbreviation;
    } else if (conversion == weight) {
      selectedItemWeight['Item'] = unitName;
      selectedItemWeight['ItemAbbreviation'] = unitAbbreviation;
    } else if (conversion == volume) {
      selectedItemVolume['Item'] = unitName;
      selectedItemVolume['ItemAbbreviation'] = unitAbbreviation;
    } else if (conversion == temperature) {
      selectedItemTemperature['Item'] = unitName;
      selectedItemTemperature['ItemAbbreviation'] = unitAbbreviation;
    } else if (conversion == cooking) {
      selectedItemCooking['Item'] = unitName;
      selectedItemCooking['ItemAbbreviation'] = unitAbbreviation;
    }

    notifyListeners();
  }

  String result({required String unitName, required String selectedItem}) {
    try {
      double inputValue;

      if (controller.text == '') {
        inputValue = 1;
      } else {
        inputValue = double.parse(getInputResult());
      }

      switch (selectedItem) {
        case 'Kelvin':
          if (unitName == 'Santigrat') {
            inputValue = inputValue * (-272.15);
          } else if (unitName == 'Fahrenhayt') {
            inputValue = inputValue * (-457.87);
          }
          break;
        case 'Fahrenhayt':
          if (unitName == 'Santigrat') {
            inputValue = inputValue * (-17.2222222);
          } else if (unitName == 'Kelvin') {
            inputValue = inputValue * (255.927778);
          }
          break;
        default:
          inputValue = inputValue *
              conversionFactors[selectedItem] *
              (1 / conversionFactors[unitName]);
          break;
      }
      resultValue = inputValue.toStringAsFixed(6);
      resultValue = resultValue.replaceAll(RegExp(r"([.]*000000)(?!.*\d)"), "");
    } catch (e) {}
    return resultValue;
  }
}
