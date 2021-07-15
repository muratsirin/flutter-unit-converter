import 'package:flutter/material.dart';
import 'package:unit_converter/model/conversion.dart';
import 'package:unit_converter/provider/conversion_data.dart';

class UnitList extends StatelessWidget {
  final List<Conversion> conversion;
  final ConversionData conversionData;
  final String selectedItem;
  const UnitList({
    Key? key,
    required this.conversion,
    required this.conversionData,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final Conversion conversionItem = conversion[index];
        return ListTile(
          title: Text(
            conversionItem.unitName,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            conversionItem.unitAbbreviation,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          trailing: Text(
            conversionData.result(
              unitName: conversionItem.unitName,
              selectedItem: selectedItem,
            ),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: conversion.length,
    );
  }
}
