import 'package:flutter_application_1/menu/Account.dart';
import 'package:flutter_application_1/menu/History.dart';
import 'package:flutter_application_1/menu/Overview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 3, 20, 0)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MY Money App'),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 3, 20, 0)),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'MY Money App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final tabs = [Overview(), History(), Account()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green[900], // สีของรายการที่ถูกเลือก
          unselectedItemColor: Colors.green[200], // สีของรายการที่ไม่ได้เลือก
          iconSize: 25,
          items: [
            BottomNavigationBarItem(
              icon: Image.network(
                'https://shorturl.asia/XwyDq',
                color: Colors.green[700],
                width: 25,
                height: 25,
              ),
              label: 'ภาพรวม',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Image.network(
                'https://shorturl.asia/inJpH',
                color: Colors.green[700],
                width: 25,
                height: 25,
              ),
              label: 'รายรับ/รายจ่าย',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Image.network(
                'https://shorturl.asia/pYaMc',
                color: Colors.green[600],
                width: 25,
                height: 25,
              ),
              label: 'ผู้ใช้',
              backgroundColor: Colors.white,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
