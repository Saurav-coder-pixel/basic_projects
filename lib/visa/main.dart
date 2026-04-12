import 'package:flutter/material.dart';
import 'package:basic_projects/visa/pages/home.dart';
import 'package:basic_projects/visa/utils/colors.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.bgColor
      ),
      home: Home(),
    );
  }
}
