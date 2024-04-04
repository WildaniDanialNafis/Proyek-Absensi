import 'package:flutter/material.dart';

class Default extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar Demo'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabBar(
                  tabs: [
                    Tab(text: 'Tab 1'),
                    Tab(text: 'Tab 2'),
                    Tab(text: 'Tab 3'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Center(child: Text('Tab 1 Content')), // Widget for Tab 1
                      Center(child: Text('Tab 2 Content')), // Widget for Tab 2
                      Center(child: Text('Tab 3 Content')), // Widget for Tab 3
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
