import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TableSelector extends StatefulWidget {
  const TableSelector({super.key});

  @override
  State<TableSelector> createState() => _TableSelectorState();
}

class _TableSelectorState extends State<TableSelector> {
  List table = [
    {'number': 'โต๊ะ1', 'person': 'นั่งได้ 4 คน'},
    {'number': 'โต๊ะ2', 'person': 'นั่งได้ 5 คน'},
    {'number': 'โต๊ะ3', 'person': 'นั่งได้ 3 คน'},
    {'number': 'โต๊ะ4', 'person': 'นั่งได้ 4 คน'},
    {'number': 'โต๊ะ5', 'person': 'นั่งได้ 2 คน'},
    {'number': 'โต๊ะ6', 'person': 'นั่งได้ 4 คน'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: table.length,
              itemBuilder: (context, index) =>
                  Table(table: table, index: index),
            ),
          ),
        ]),
      ),
    ));
  }

  Widget Table({required table, required index}) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blue[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  table[index]['number'],
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  table[index]['person'],
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          Container(
            height: 4,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
