import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/provider/conversion_data.dart';
import 'package:unit_converter/view/home_screen.dart';

void main() {
  runApp(UnitConverter());
}

class UnitConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConversionData(),
        ),
      ],
      child: MaterialApp(
        title: 'Unit Converter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
