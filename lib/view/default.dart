import 'package:aplikasi_history_absensi/view/login_card.dart';
import 'package:aplikasi_history_absensi/view/signup_card.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class Default extends StatelessWidget {
  const Default({super.key});

  @override
  Widget build(BuildContext context) {
    page({required Widget child}) =>
        Styled.widget(child: child).padding(vertical: 30, horizontal: 20);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar in Body'),
        ),
        body: <Widget>[
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                LoginCard(),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ].toColumn().parent(page),
      ),
    );
  }
}

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('First Tab'));
  }
}

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Second Tab'));
  }
}

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Third Tab'));
  }
}
