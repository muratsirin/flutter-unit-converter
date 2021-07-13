import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unit_converter/provider/helpers/conversion_list.dart';
import 'package:unit_converter/view/unit_screen.dart';

class ConversionData extends ConversionList with ChangeNotifier {
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
      UnitScreen(conversion: length),
      UnitScreen(conversion: area),
      UnitScreen(conversion: weight),
      UnitScreen(conversion: volume),
      UnitScreen(conversion: temperature),
      UnitScreen(conversion: cooking),
    ];

    return unitScreenItems;
  }
}
