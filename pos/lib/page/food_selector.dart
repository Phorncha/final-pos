import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:note3/provider/store.dart';
import 'package:provider/provider.dart';

class FoodSelector extends StatefulWidget {
  const FoodSelector({super.key});

  @override
  State<FoodSelector> createState() => _FoodSelectorState();
}

class _FoodSelectorState extends State<FoodSelector> {
  bool check = false;
  List listFood = [
    {
      'pic': 'Food',
      'name': 'ผัดไทย',
      'price': '50',
      'controller': false,
    },
    {
      'pic': 'Food',
      'name': 'ต้มยำกุ้ง',
      'price': '80',
      'controller': false,
    },
    {
      'pic': 'Food',
      'name': 'กระเพราหมู',
      'price': '50',
      'controller': false,
    },
    {
      'pic': 'Food',
      'name': 'บะหมี่',
      'price': '40',
      'controller': false,
    },
    {
      'pic': 'Food',
      'name': 'ไก่ย่าง',
      'price': '60',
      'controller': false,
    },
    {
      'pic': 'Food',
      'name': 'ส้มตำ',
      'price': '50',
      'controller': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<Store>();
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าเลือกอาหาร'),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: listFood.length,
        itemBuilder: (context, index) =>
            Food(listFood: listFood, index: index, Provider: provider),
      )),
    );
  }

  Widget Food(
      {required List<dynamic> listFood, required index, required Provider}) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: Text(listFood[index]['pic']),
            title: Text(listFood[index]['name']),
            subtitle: Text(listFood[index]['price']),
          ),
        ),
        Row(
          children: [
            IconButton(onPressed: Provider.remove, icon: Icon(Icons.remove)),
            Text(Provider.count.toString()),
            IconButton(onPressed: Provider.add, icon: Icon(Icons.add)),
          ],
        )
      ],
    );
  }
}
