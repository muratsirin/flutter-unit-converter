import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/model/conversion.dart';
import 'package:unit_converter/provider/conversion_data.dart';
import 'package:unit_converter/utils/constants.dart';

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
            style: kResultTextStyle,
          ),
          subtitle: Text(
            conversionItem.unitAbbreviation,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          trailing: AutoSizeText(
            conversionData.result(
              unitName: conversionItem.unitName,
              selectedItem: selectedItem,
            ),
            style: kResultTextStyle,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey,
        );
      },
      itemCount: conversion.length,
    );
  }
}
