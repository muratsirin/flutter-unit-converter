import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unit_converter/model/conversion.dart';
import 'package:unit_converter/provider/helpers/conversion_list.dart';
import 'package:unit_converter/view/unit_screen.dart';

class ConversionData extends ConversionList with ChangeNotifier {
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
        selectedItem: selectedItemLength['Item'],
        selectedItemAbbreviation: selectedItemLength['ItemAbbreviation'],
      ),
      UnitScreen(
        conversion: area,
        selectedItem: selectedItemArea['Item'],
        selectedItemAbbreviation: selectedItemArea['ItemAbbreviation'],
      ),
      UnitScreen(
        conversion: weight,
        selectedItem: selectedItemWeight['Item'],
        selectedItemAbbreviation: selectedItemWeight['ItemAbbreviation'],
      ),
      UnitScreen(
        conversion: volume,
        selectedItem: selectedItemVolume['Item'],
        selectedItemAbbreviation: selectedItemVolume['ItemAbbreviation'],
      ),
      UnitScreen(
        conversion: temperature,
        selectedItem: selectedItemTemperature['Item'],
        selectedItemAbbreviation: selectedItemTemperature['ItemAbbreviation'],
      ),
      UnitScreen(
        conversion: cooking,
        selectedItem: selectedItemCooking['Item'],
        selectedItemAbbreviation: selectedItemCooking['ItemAbbreviation'],
      ),
    ];

    return unitScreenItems;
  }

  void printIndex(int index) {
    unitTopBarList.map((Tab tab) {
      print(tab.text);
    }).toList();
    print(index);
  }

  void setSelectedItem(
      {required String unitName,
      required String unitAbbreviation,
      required List<Conversion> conversion}) {
    if (conversion == length) {
      selectedItemLength['Item'] = unitName;
      selectedItemLength['ItemAbbreviation'] = unitAbbreviation;
    } else if (conversion == area) {
      selectedItemArea = unitName;
    }
    print(selectedItemLength);
    notifyListeners();
  }

  // void updateSelectedItem2({required List<Conversion> conversion}) {
  //   if (conversion == length) {
  //     selectedItem = length.first.unitName;
  //   } else if (conversion == area) {
  //     selectedItem = area.first.unitName;
  //   } else if (conversion == weight) {
  //     selectedItem = weight.first.unitName;
  //   } else if (conversion == volume) {
  //     selectedItem = volume.first.unitName;
  //   } else if (conversion == temperature) {
  //     selectedItem = temperature.first.unitName;
  //   } else if (conversion == cooking) {
  //     selectedItem = cooking.first.unitName;
  //   }
  // }

  // void updateSelectedItem({required int index}) {
  //   switch (index) {
  //     case 0:
  //       selectedItem = length.first.unitName;
  //       selectedItemAbbreviation = length.first.unitAbbreviation;
  //       break;
  //     case 1:
  //       selectedItem = area.first.unitName;
  //       selectedItemAbbreviation = area.first.unitAbbreviation;
  //       break;
  //     case 2:
  //       selectedItem = weight.first.unitName;
  //       selectedItemAbbreviation = weight.first.unitAbbreviation;
  //       break;
  //     case 3:
  //       selectedItem = volume.first.unitName;
  //       selectedItemAbbreviation = volume.first.unitAbbreviation;
  //       break;
  //     case 4:
  //       selectedItem = temperature.first.unitName;
  //       selectedItemAbbreviation = temperature.first.unitAbbreviation;
  //       break;
  //     case 5:
  //       selectedItem = cooking.first.unitName;
  //       selectedItemAbbreviation = cooking.first.unitAbbreviation;
  //       break;
  //   }
  //
  //   notifyListeners();
  // }
}
