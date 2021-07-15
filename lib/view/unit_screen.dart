import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/model/conversion.dart';
import 'package:unit_converter/provider/conversion_data.dart';
import 'package:unit_converter/view/numpad.dart';
import 'package:unit_converter/view/show_bottom_unit_list.dart';
import 'package:unit_converter/view/unit_list.dart';

class UnitScreen extends StatelessWidget {
  final List<Conversion> conversion;
  final String selectedItem;
  final String selectedItemAbbreviation;
  const UnitScreen(
      {Key? key,
      required this.conversion,
      required this.selectedItem,
      required this.selectedItemAbbreviation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConversionData>(
      builder: (context, conversionData, child) {
        return LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            return Column(
              verticalDirection: VerticalDirection.down,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.1,
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.5,
                          child: ListTile(
                            title: Text(
                              selectedItem,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              selectedItemAbbreviation,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(Icons.unfold_more),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return ShowBottomUnitList(
                                    conversion: conversion,
                                    conversionData: conversionData,
                                    selectedItem: selectedItem,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller: conversionData.controller,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              autofocus: true,
                              showCursor: true,
                              readOnly: true,
                              textAlign: TextAlign.right,
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height: constraints.maxHeight * 0.7,
                                      child: Numpad(),
                                    );
                                  },
                                ).then((value) => conversionData.thenNumpad());
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                counterText: '',
                                hintText: '1',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.01,
                  child: Divider(),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.89,
                  child: UnitList(
                    conversion: conversion,
                    conversionData: conversionData,
                    selectedItem: selectedItem,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
