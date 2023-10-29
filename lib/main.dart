import 'package:flutter/material.dart';
import './ui/screens.dart';

void main() {
  runApp(MyApp());
}

// PageController controller = PageController(initialPage: 0);

class MyApp extends StatefulWidget  {
  // @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  
  // const MyApp({super.key});
  
  int _currentIndex = 0;

  // ignore: unused_field
  final List<Widget> _tabs = [
    const MyGridView(),
    const LoadingSreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _tabs,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books),
              label: 'Libary',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
  );
  }
}

