import 'package:flutter/material.dart';
import './ui/screens.dart';


void main() {
  runApp(const MyApp());
}

PageController controller = PageController(initialPage: 0);

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: LoginScreen(controller: controller),
      // home: LoadingSreen(),
    );
  }
}

