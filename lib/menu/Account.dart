// import 'lib/main.dart'
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Account? account;
  String? title;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    // ทำงานที่จำเป็นเพื่อดึงข้อมูล
    // เมื่อดึงข้อมูลเสร็จสมบูรณ์
    setState(() {
      isLoading = false;
      title = 'บัญชีของคุณ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'บัญชีของคุณ',
          style: TextStyle(
            fontSize: 24, // Adjust the font size
            fontWeight: FontWeight.bold, // Set the font weight to bold
            color: Color.fromARGB(255, 24, 23, 23), // Change the text color
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  userPersonal(),
                  name(),
                  SizedBox(
                    height: 100,
                  ),
                  logout(context),
                ],
              ),
      ),
    );
  }

  Widget name() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Center(
          child: Text(
            "u_name", // แทนด้วยชื่อของคุณ
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 58, 22, 3),
            ),
          ),
        ),
      ),
    );
  }

  Widget userPersonal() {
    return Stack(
      fit: StackFit.loose,
      children: [
        Center(
          child: proflie(),
        ),
        Positioned(
          top: 150,
          left: 0,
          right: 0,
          child: Center(
            child: test(),
          ),
        ),
      ],
    );
  }

  Widget test() {
    return Center(
      child: Container(
        width: 105,
        height: 105,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 14, 140, 20),
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Align(
            alignment: Alignment(0, 0),
            child: Center(
              child: SizedBox(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100 / 2),
                  child: Image(
                    image: NetworkImage(
                      'https://shorturl.asia/Oc9f4',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget proflie() {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: SizedBox(
              height: 270,
              child: Container(
                alignment: Alignment.topCenter,
                child: Image(
                  image: NetworkImage(
                    'https://shorturl.asia/j3Ohi',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

Widget logout(context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Container(
                child: Image(
                  image: NetworkImage('https://shorturl.asia/aKUWS'),
                  width: 45,
                  height: 45,
                ),
              ),
            ),
            TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    HomePage(), // แทน SignUpPage ด้วยชื่อหน้าของคุณ
              )); //
            },
              child: Text(
                '  ออกจากระบบ',
                style: TextStyle(fontSize: 20, color: Colors.green[900]),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}


