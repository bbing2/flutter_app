import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newvoca/page/screen_page.dart';




void main() async{

  await Hive.initFlutter();
  await Hive.openBox('voca');

  runApp(MaterialApp(
    home: ScreenPage(),
    debugShowCheckedModeBanner: false,
  ));
}
