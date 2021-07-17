import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/provider/conversion_data.dart';
import 'package:unit_converter/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColorDark,
        body: Consumer<ConversionData>(
          builder: (context, conversionData, child) {
            return DefaultTabController(
              length: conversionData.unitTopBarList.length,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                    backgroundColor: kOperatorTextColor,
                    unselectedBackgroundColor: kOperatorColorDark,
                    labelStyle: TextStyle(color: Colors.white),
                    unselectedLabelStyle: TextStyle(color: Colors.white),
                    borderWidth: 1,
                    unselectedBorderColor: Colors.white,
                    radius: 100,
                    tabs: conversionData.unitTopBarList,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: conversionData.unitScreenList(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
