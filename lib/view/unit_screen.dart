import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/model/conversion.dart';
import 'package:unit_converter/provider/conversion_data.dart';
import 'package:unit_converter/utils/constants.dart';
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
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              selectedItemAbbreviation,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.unfold_more,
                              color: Colors.white,
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return SizedBox(
                                    height: constraints.maxHeight,
                                    child: ShowBottomUnitList(
                                      conversion: conversion,
                                      conversionData: conversionData,
                                      selectedItem: selectedItem,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: conversionData.controller,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            autofocus: true,
                            showCursor: true,
                            readOnly: true,
                            textAlign: TextAlign.right,
                            cursorColor: Colors.white,
                            style: kResultTextStyle,
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
                              hintStyle: kResultTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.01,
                  child: Divider(
                    color: Colors.grey,
                  ),
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
