import 'package:flutter/material.dart';
import 'package:tugas_depri_1/views/user/detail.dart';
import 'package:tugas_depri_1/views/user/list.dart';
import 'package:tugas_depri_1/views/user/navigation_page.dart';
import 'package:tugas_depri_1/views/user/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    RegisterUserPage.tag: (context) => const RegisterUserPage(),
    ListUserPage.tag: (context) => const ListUserPage(),
    DetailUserPage.tag: (context) => const DetailUserPage(),
    NavigationPage.tag: (context) => const NavigationPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterUserPage(),
    );
  }
}
