import 'package:aplikasi_history_absensi/view/signup_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
            'Sign Up',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ).alignment(Alignment.center).padding(bottom: 20),
          SignupCard(),
          <Widget>[
            GestureDetector(
                onTap: () {
                  Get.offNamed("/login");
                },
                child: Text("Memiliki akun"))
          ].toRow(mainAxisAlignment: MainAxisAlignment.start).parent(page),
        ].toColumn(mainAxisAlignment: MainAxisAlignment.center).parent(page),
      ),
    );
  }
}
