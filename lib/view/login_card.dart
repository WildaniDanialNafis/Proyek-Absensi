import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  Widget _buildLoginCard() {
    return <Widget>[
      TextFormField(
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email),
            hintText: "email atau nama pengguna",
            hintStyle: const TextStyle(color: Colors.grey),
            fillColor: Colors.grey[100],
            filled: true,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)))),
      ),
      const SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.password),
            hintText: "kata sandi",
            hintStyle: const TextStyle(color: Colors.grey),
            fillColor: Colors.grey[100],
            filled: true,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed("/profile");
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))))),
            child: const Text(
              "Masuk",
              style: TextStyle(color: Colors.white),
            ),
          ))
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoginCard();
  }
}
