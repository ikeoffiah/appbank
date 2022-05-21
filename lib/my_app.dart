import 'package:bankapp/home.dart';
import 'package:bankapp/pages/account_detail.dart';
import 'package:bankapp/pages/account_page.dart';
import 'package:bankapp/pages/add_account.dart';
import 'package:bankapp/pages/login.dart';
import 'package:bankapp/pages/login.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddAccount(),
    );
  }
}
