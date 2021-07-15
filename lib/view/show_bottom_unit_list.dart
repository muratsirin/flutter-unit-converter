import 'package:flutter/material.dart';
import 'package:unit_converter/model/conversion.dart';
import 'package:unit_converter/provider/conversion_data.dart';

class ShowBottomUnitList extends StatelessWidget {
  final List<Conversion> conversion;
  final ConversionData conversionData;
  final String selectedItem;
  const ShowBottomUnitList({
    Key? key,
    required this.conversion,
    required this.conversionData,
    required this.selectedItem,
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
              trailing: conversionItem.unitName == selectedItem
                  ? Icon(Icons.check)
                  : Text(''),
              onTap: () {
                conversionData.setSelectedItem(
                  unitName: conversionItem.unitName,
                  unitAbbreviation: conversionItem.unitAbbreviation,
                  conversion: conversion,
                );
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
