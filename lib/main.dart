import 'package:flutter/material.dart';
import 'package:flutter_demo/tabs/first.dart';
import 'package:flutter_demo/tabs/second.dart';
import 'package:flutter_demo/tabs/third.dart';
import 'package:flutter_demo/screens/account.dart';
import 'package:flutter_demo/screens/home.dart';
import 'package:flutter_demo/screens/settings.dart';

void main() {
  runApp(MaterialApp(
    // Title
    title: "Using Tabs",
    // Home
    home: HomeScreen(),
    routes: <String, WidgetBuilder>{
      SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
      AccountScreen.routeName: (BuildContext context) => AccountScreen(),
    },
  ));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  /*
   *-------------------- Setup Tabs ------------------*
   */
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          // set icon to the tab
          icon: Icon(Icons.favorite),
        ),
        Tab(
          icon: Icon(Icons.adb),
        ),
        Tab(
          icon: Icon(Icons.airport_shuttle),
        ),
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  /*
   *-------------------- Setup the page by setting up tabs in the body ------------------*
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Using Tabs"),
        // Set the background color of the App Bar
        backgroundColor: Colors.blue,
        // Set the bottom property of the Appbar to include a Tab Bar
        ///            bottom: getTabBar()
      ),
      // Set the TabBar view as the body of the Scaffold
      body: getTabBarView(<Widget>[First(), Second(), Third()]),
      bottomNavigationBar: BottomAppBar(
        child: getTabBar(),
        color: Colors.blue,
      ),
    );
  }
}
