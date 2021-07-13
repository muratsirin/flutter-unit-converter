import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Utils {
  List<Tab> unitMenuList = [
    Tab(
      icon: Icon(FontAwesomeIcons.calculator),
      text: 'Hesap Makinesi',
    ),
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
}
