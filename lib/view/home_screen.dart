import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/provider/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Utils>(
        builder: (context, utilsData, child) {
          return DefaultTabController(
            length: utilsData.unitMenuList.length,
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
                    tabs: utilsData.unitMenuList,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Text('fdsfsdfsdf'),
                      Text('fdsfsdfsdf'),
                      Text('fdsfsdfsdf'),
                      Text('fdsfsdfsdf'),
                      Text('fdsfsdfsdf'),
                      Text('fdsfsdfsdf'),
                      Text('fdsfsdfsdf'),
                    ],
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
