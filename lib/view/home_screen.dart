import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/provider/conversion_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ConversionData>(
        builder: (context, conversionData, child) {
          return DefaultTabController(
            length: conversionData.unitTopBarList.length,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ButtonsTabBar(
                    backgroundColor: Colors.blue[600],
                    unselectedBackgroundColor: Colors.white,
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(
                        color: Colors.blue[600], fontWeight: FontWeight.bold),
                    borderWidth: 1,
                    unselectedBorderColor: Colors.blue[600]!,
                    radius: 100,
                    tabs: conversionData.unitTopBarList,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: TabBarView(
                      children: conversionData.unitScreenList(),
                    ),
                    // onTap: () {
                    //   conversionData.printIndex(controller.index);
                    // },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
