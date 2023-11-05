// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'main.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0), // เพิ่ม Padding ที่นี่
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _inputFields(context),
                _loginInfo(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "Create Account",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter details to get started"),
      ],
    );
  }

  _inputFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Username",
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Nickname",
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.edit),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Retype Password",
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // เด้งกลับมายังหน้าก่อนหน้า
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF7BFF82),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          child: const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  _loginInfo(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    HomePage(), // แทน SignUpPage ด้วยชื่อหน้าของคุณ
              )); //
            },
            child: Text("Login"))
      ],
    );
  }
}
