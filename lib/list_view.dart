import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListIndi extends StatefulWidget {
  const ListIndi({Key? key}) : super(key: key);

  @override
  State<ListIndi> createState() => _ListIndiState();
}

class _ListIndiState extends State<ListIndi> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item: $index',
                style: TextStyle(
                    color: selectedIndex == index
                        ? Colors.blue
                        : Colors.greenAccent)),
            // tileColor: selectedIndex == index ? Colors.blue : null,
            onTap: () {
              setState(() {
                selectedIndex = index;
                print(selectedIndex);
              });
            },
          );
        },
      ),
    ));
  }
}
