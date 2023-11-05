import 'package:flutter/material.dart';
import 'package:flutter_application_1/menu/incomePage.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class Transaction {
  final String title;
  final double amount;
  final String currency;
  final String description;
  final String date;

  Transaction(
      this.title, this.amount, this.currency, this.description, this.date);
}

class _HistoryState extends State<History> {
  String? title;
  bool isLoading = false;

  List<Transaction> transactions = [
    Transaction(
      "รายรับ",
      100.0,
      "บาท",
      "ค่าขนม",
      "03/11/2566",
    ),
    Transaction(
      "รายรับ",
      1000.0,
      "บาท",
      "ค่าขนม",
      "03/11/2566",
    ),
    Transaction(
      "รายจ่าย",
      50.0,
      "บาท",
      "ค่าอาหาร",
      "03/11/2566",
    ),
    Transaction(
      "รายจ่าย",
      500.0,
      "บาท",
      "ค่าอาหารหมา",
      "03/11/2566",
    ),
    // เพิ่มรายการรายรับหรือรายจ่ายอีกตามต้องการ
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Widget data() {
    return Center(
      child: SizedBox(
        height: 60,
        width: 500,
        child: Card(
          child: Center(
            child: Text(
              "บัญชีรายรับรายจ่าย",
              style: TextStyle(
                  fontSize: 26, color: const Color.fromARGB(255, 1, 27, 3)),
            ),
          ),
        ),
      ),
    );
  }

  Widget dataIn(Transaction transaction) {
    return Card(
      child: ListTile(
        leading: Icon(
          transaction.title == "รายรับ"
              ? Icons.arrow_upward
              : Icons.arrow_downward,
          color: transaction.title == "รายรับ" ? Colors.green : Colors.red,
        ),
        title: Text(transaction.title),
        subtitle: Text(
            "${transaction.amount} ${transaction.currency} - ${transaction.description}"),
        trailing: Text("วันที่ ${transaction.date}"),
      ),
    );
  }

  void fetchData() async {
    // ทำงานที่จำเป็นเพื่อดึงข้อมูล
    // เมื่อดึงข้อมูลเสร็จสมบูรณ์
    setState(() {
      isLoading = false;
      title = 'รายรับ/รายจ่าย';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  data(),
                  SizedBox(
                    height: 20,
                  ),
                  ...transactions
                      .map((transaction) => dataIn(transaction))
                      .toList(),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ClipOval(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(70, 70),
                        ),
                        child: Icon(Icons.add),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IncomePage()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
