// login.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/ServicesUser.dart';
import 'SignUp.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Login Page'),
            SizedBox(height: 20), // เพิ่มระยะห่าง
            ElevatedButton(
              onPressed: () {
                // เมื่อปุ่ม "สมัครสมาชิก" ถูกกด
                // ทำสิ่งที่คุณต้องการ เช่น นำคุณไปยังหน้าสมัครสมาชิก
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Signup(), // เปลี่ยนเป็นหน้าสมัครสมาชิก
                  ),
                );
              },
              child: Text('สมัครสมาชิก'),
            ),
          ],
        ),
      ),
    );
  }
}
