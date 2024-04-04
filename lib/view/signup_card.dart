import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class SignupCard extends StatelessWidget {
  const SignupCard({super.key});

  Widget _buildSignupCard() {
    return <Widget>[
      TextFormField(
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email),
            hintText: "email",
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
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))))),
            child: const Text(
              "Daftar",
              style: TextStyle(color: Colors.white),
            ),
          ))
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[_buildSignupCard()]
        .toColumn(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min)
        .padding(horizontal: 10, vertical: 0)
        .decorated(color: Colors.white)
        .alignment(Alignment.center);
  }
}
