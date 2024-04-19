import 'package:aplikasi_history_absensi/view/login_view.dart';
import 'package:aplikasi_history_absensi/view/profile_page.dart';
import 'package:aplikasi_history_absensi/view/profile_view.dart';
import 'package:aplikasi_history_absensi/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/login",
      getPages: [
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(name: "/signup", page: () => SignupPage()),
        GetPage(name: "/profile", page: () => ProfilePage()),
        GetPage(name: "/profile/detail", page: () => ProfileDetailPage()),
      ],
    );
  }
}
