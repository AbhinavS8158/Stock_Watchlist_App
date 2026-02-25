import 'package:bmtask/constant.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget buildAppbar(String title){
    return AppBar(
        backgroundColor: AppColor.blueAccent,
        elevation: 0,
        centerTitle: true,
        title:  Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
       
      );
}