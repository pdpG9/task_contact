import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_contact/ui/menu/main_provider.dart';
import 'package:task_contact/ui/menu/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: ChangeNotifierProvider(
          create: (_) => MainModel(),
          child: const MenuPage()),
    );
  }
}
