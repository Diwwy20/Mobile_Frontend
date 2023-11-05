import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_application_1/menu/incomePage.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  ExpensesPage? expensesPage;
  String? title;
  bool isLoading = false;
  final fromDescription = GlobalKey<FormState>();

  late TextEditingController controller;
  String textMoney = '';

  String dropdownValue = 'เงินสด';
  String dropdownM = 'ค่าอาหาร';

  @override
  void initState() {
    super.initState();
    fetchData();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void fetchData() async {
    setState(() {
      isLoading = false;
      title = 'บันทึกรายรับ/รายจ่าย';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บันทึกรายรับรายจ่าย'),
        backgroundColor: Colors.green[400],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 165,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const IncomePage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Text(
                                  'เพิ่มรายรับ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 165,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ExpensesPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[700],
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Text(
                                  'เพิ่มรายจ่าย',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: profile(),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  "เพิ่มค่าใช้จ่ายของวันนี้",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.green[700]),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextField(
                                      controller: controller,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: '          กรอกจำนวนเงิน',
                                        hintStyle: TextStyle(fontSize: 30
                                            // ใช้ textAlign เพื่อจัดตำแหน่งข้อความใน TextField ให้อยู่ตรงกลาง
                                            // textAlign: TextAlign.center,
                                            ),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                      ),
                                      onSubmitted: (String value) {
                                        setState(() {
                                          textMoney = controller.text;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.end, // ชิดขวาแนวนอน
                                  children: [
                                    DropdownButton<String>(
                                      value: dropdownValue,
                                      icon: const Icon(Icons.menu),
                                      style: const TextStyle(
                                          color: Colors
                                              .green), // รายการที่ถูกเลือก
                                      underline: Container(
                                        height: 2,
                                        color: Colors.green,
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                      items: [
                                        DropdownMenuItem<String>(
                                          value: 'เงินสด',
                                          child: Text('เงินสด'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'เงินโอน',
                                          child: Text('เงินโอน'),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    DropdownButton<String>(
                                      value: dropdownM,
                                      icon: const Icon(Icons.menu),
                                      style: const TextStyle(
                                          color: Colors
                                              .green), // รายการที่ถูกเลือก
                                      underline: Container(
                                        height: 2,
                                        color: Colors.green,
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownM = newValue!;
                                        });
                                      },
                                      items: [
                                        DropdownMenuItem<String>(
                                          value: 'ค่าอาหาร',
                                          child: Text('ค่าอาหาร'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'ค่าเดินทาง',
                                          child: Text('ค่าเดินทาง'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'ของใช้',
                                          child: Text('ของใช้'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'ค่ารักษา',
                                          child: Text('ค่ารักษา'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'ชำระหนี้',
                                          child: Text('ชำระหนี้'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'ค่าบ้าน',
                                          child: Text('ค่าบ้าน'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'อื่น ๆ',
                                          child: Text('อื่น ๆ'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 30),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'คำอธบายเพิ่มเติม',
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // ตรงนี้คุณสามารถเพิ่มโค้ดเพื่อบันทึกรายการ
                                        // และทำอะไรก็ได้ที่คุณต้องการเมื่อปุ่มถูกกด
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Colors.green, // สีพื้นหลังของปุ่ม
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10), // ปรับขนาดของปุ่ม
                                      ),
                                      child: const Text(
                                        'บันทึกรายการ',
                                        style: TextStyle(
                                          fontSize:
                                              20, // ปรับขนาดตัวอักษรของปุ่ม
                                          color: Colors.white, // สีของตัวอักษร
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

Widget profile() {
  return Center(
    child: Container(
      width: 105,
      height: 105,
      decoration: BoxDecoration(
        color: Colors.green[400],
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
