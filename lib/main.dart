import 'package:aplikasi_history_absensi/view/profile_page.dart';
import 'package:aplikasi_history_absensi/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'user/authentication/login_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Attendance App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      getPages: [
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(name: "/profile", page: () => ProfilePage()),
        GetPage(name: "/profile/detail", page: () => ProfileDetailPage()),
      ],
    );
  }
}
