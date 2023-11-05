import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  String? title;
  bool isLoading = false;

  double monthlyIncome = 100.0; // รายได้
  double monthlyExpenses = 4000.0; // ค่าใช้จ่าย

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
      title = 'ภาพรวม';
    });
  }

  String checkFinancialHealth(double income, double expenses) {
    double balance = income - expenses;

    if (balance > 0) {
      return "สุขภาพการเงินดี";
    } else if (balance == 0) {
      return "สุขภาพการเงินปานกลาง";
    } else {
      return "สุขภาพการเงินไม่ดี";
    }
  }

  Widget financialHealthWidget(double income, double expenses) {
    String healthStatus = checkFinancialHealth(income, expenses);

    return Center(
      child: Text(
        healthStatus,
        style: TextStyle(
          fontSize: 19,
          color: Colors.green[700], // สีของข้อความ
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = "${now.day}-${now.month}-${now.year}";
    String formattedTime = "${now.hour}:${now.minute}:${now.second}";

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    card1(formattedDate, formattedTime),
                    AllPay(monthlyIncome, monthlyExpenses),
                  ],
                ),
              ),
      ),
    );
  }

  Widget card1(String formattedDate, String formattedTime) {
    return Container(
      child: Center(
        child: SizedBox(
          width: 370,
          height: 310,
          child: Card(
            color: Colors.green[700],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "วันที่: $formattedDate",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(" "),
                            Text(
                              "เวลา: $formattedTime",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text("คงเหลือ  ",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white)),
                          Image(
                            image: NetworkImage(
                              'https://shorturl.asia/rgU5q',
                            ),
                            width: 35,
                            height: 35,
                          ),
                        ],
                      ),
                      Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 40, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                'รายได้',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Image(
                                image:
                                    NetworkImage('https://shorturl.asia/pFE74'),
                                color: Colors.white,
                                width: 30,
                                height: 35,
                              ),
                              Text(
                                'เงินสด',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Image(
                                image:
                                    NetworkImage('https://shorturl.asia/pFE74'),
                                color: Colors.white,
                                width: 30,
                                height: 35,
                              ),
                              Text(
                                'เงินโอน',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              SizedBox(width: 60), // ระยะห่าง 10 พิกเซล
                              Text(
                                '0',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              SizedBox(width: 60), // ระยะห่าง 10 พิกเซล
                              Text(
                                '0',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget AllPay(double monthlyIncome, double monthlyExpenses) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 380,
            height: 280,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ค่าใช้จ่ายวันนี้',
                    style: TextStyle(fontSize: 20, color: Colors.green[700]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 70, color: Colors.green[900]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          'สุขภาพทางการเงิน :  ',
                          style:
                              TextStyle(fontSize: 19, color: Colors.green[700]),
                        ),
                        financialHealthWidget(monthlyIncome, monthlyExpenses),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
