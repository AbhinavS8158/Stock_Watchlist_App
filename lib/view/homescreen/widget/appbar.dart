import 'package:flutter/material.dart';

PreferredSizeWidget buildAppbar(){
    return AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Stock Search",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
       
      );
}