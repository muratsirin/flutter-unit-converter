import 'package:flutter/material.dart';
import 'package:unit_converter/model/conversion.dart';
import 'package:unit_converter/provider/conversion_data.dart';

class ShowBottomUnitList extends StatelessWidget {
  final List<Conversion> conversion;
  final ConversionData conversionData;
  const ShowBottomUnitList({
    Key? key,
    required this.conversion,
    required this.conversionData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            final Conversion conversionItem = conversion[index];
            return ListTile(
              title: Text(
                conversionItem.unitName,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                conversionItem.unitAbbreviation,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              // trailing: conversionItem.unitName ==
              //         conversionData.getSelectedItem(conversion: conversion)
              //     ? Icon(Icons.check)
              //     : Text(''),
              onTap: () {
                conversionData.setSelectedItem(
                    conversionItem.unitName, conversion);
                Navigator.pop(context);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: conversion.length,
        ),
      ),
    );
  }
}
