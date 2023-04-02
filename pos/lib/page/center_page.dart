import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:note3/page/food_selector.dart';
import 'package:note3/services/auth_service.dart';

import '../screens/login_screen.dart';

class CenterPage extends StatefulWidget {
  const CenterPage({super.key, required String title});

  @override
  State<CenterPage> createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  AuthService _service = new AuthService();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    List dataList = [
      {'name': 'รายการอาหาร', 'icon': Icons.list_alt},
      {'name': 'เครื่องดื่ม', 'icon': Icons.no_drinks},
      {'name': 'วิเคราะห์', 'icon': Icons.groups_sharp},
      {'name': 'ออเดอร์Status', 'icon': Icons.food_bank_sharp},
      {'name': 'ออเดอร์Status', 'icon': Icons.book},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าหลัก'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: Colors.blue),
                child: Text("Hello ")),
            ListTile(
              title: const Text("Logout"),
              onTap: () {
                _service.logout(_auth.currentUser);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()), //ออกจากระบบ
                    (route) => false);
              },
            )
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dataList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FoodSelector(),
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              width: 200,
              height: 200,
              child: Center(
                  child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Icon(
                    dataList[index]['icon'],
                    size: 70,
                  ),
                  Text(
                    dataList[index]['name'],
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
