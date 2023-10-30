import 'package:ct484_project/ui/novels/novel_manager.dart';
import 'package:flutter/material.dart';
import './ui/screens.dart';


void main() {
  runApp(const MyApp());
}

// PageController controller = PageController(initialPage: 0);

class MyApp extends StatefulWidget  {
  const MyApp({super.key});

  // @override
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  
  // const MyApp({super.key});
  
  int _currentIndex = 0;

  // ignore: unused_field
  final List<Widget> _tabs = [
    const ListNovel(),
    // DetailNovelScreen(NovelsManager().items[1]),
    LoadingSreen(),
    const Profile(),
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

