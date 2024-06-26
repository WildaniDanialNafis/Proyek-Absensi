import 'package:aplikasi_history_absensi/view/login_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
        body: <Widget>[
          Icon(
            Icons.people,
            size: 48,
          ),
          Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ).alignment(Alignment.center).padding(bottom: 20),
          LoginCard(),
          <Widget>[
            GestureDetector(
                onTap: () {
                  Get.toNamed("/signup");
                },
                child: Text("Buat Akun"))
          ].toRow(mainAxisAlignment: MainAxisAlignment.start).parent(page),
        ].toColumn(mainAxisAlignment: MainAxisAlignment.center).parent(page),
      ),
    );
  }
}
