import 'package:flutter/material.dart';
import 'package:ch9_listview/widgets/header.dart';
import 'package:ch9_listview/widgets/row_with_card.dart';
import 'package:ch9_listview/widgets/row.dart';
import 'package:chp9_list_view/pages/';
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return HeaderWidget(index: index);
            } else if (index >= 1 && index <= 3) {
              return RowWithCardWidget(index: index);
            } else {
              return RowWidget(index: index);
            }
          },
        ),
      ),
    ),
  ));
}
