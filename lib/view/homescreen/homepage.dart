import 'package:bmtask/constant.dart';
import 'package:bmtask/view/homescreen/widget/appbar.dart';
import 'package:bmtask/view/homescreen/widget/list.dart';
import 'package:bmtask/view/homescreen/widget/searchfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ValueNotifier<List> searchResults = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: buildAppbar(),
      body: Column(
        children: [
          /// 🔎 Search Field
          StockSearchField(searchResults: searchResults),

          /// 📊 Results
          Expanded(
          child: StockResultList(searchResults: searchResults),
        ),
        ],
      ),
    );
  }
}
