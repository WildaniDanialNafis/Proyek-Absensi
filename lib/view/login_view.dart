import 'package:aplikasi_history_absensi/view/login_card.dart';
import 'package:aplikasi_history_absensi/view/signup_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:styled_widget/styled_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    page({required Widget child}) =>
        Styled.widget(child: child).padding(vertical: 30, horizontal: 20);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: <Widget>[
            const Icon(
              Icons.people,
              size: 48,
            ),
            const Text(
              'History Absensi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ).alignment(Alignment.center).padding(bottom: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  splashBorderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  overlayColor: MaterialStateProperty.all(Colors.grey[100]),
                  indicatorColor: Colors.black,
                  dividerColor: Colors.transparent,
                  tabs: const <Widget>[
                    Tab(
                      text: "Masuk",
                    ),
                    Tab(
                      text: "Daftar",
                    ),
                  ]),
            ),
            const Flexible(
              child: TabBarView(
                children: [LoginCard(), SignupCard()],
              ),
            ),
          ].toColumn(mainAxisAlignment: MainAxisAlignment.center).parent(page),
        ),
      ),
    );
  }
}
