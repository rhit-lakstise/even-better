import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'invite.dart';

class InviteYear extends StatefulWidget {

  const InviteYear({
    required this.currentStudent,
    Key? key,
  }) : super(key: key);
  final String currentStudent;

  @override
  State<InviteYear> createState() => _InviteYearState();
}

class _InviteYearState extends State<InviteYear> {
  List<Widget> itemsData = [];
  List<dynamic> itemStatuses = [];


  void getItemData() {
    List<Widget> listItems = [];

    for (var year = 2020 ; year <= 2025; year++ ) {
      listItems.add(ElevatedButton(
          child:  Text(year.toString()),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Invite(currentStudent: '', year: year,)));
          }));
    }

    setState(() {
      itemsData = listItems;
      //print(listItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    getItemData();

    return Scaffold(

        body: Container(

            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: itemsData.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          // print("printing");
                          // print(itemsData);
                          return itemsData[index];
                        }))

              ],
            )


        ));
  }

  @override
  void initState() {
    super.initState();
  }
}
