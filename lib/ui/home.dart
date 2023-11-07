import 'package:flutter/material.dart';
import 'screens.dart';
// import 'navigator_page.dart';
// import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const ListNovel(),
    const LoadingSreen(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // debugShowCheckedModeBanner: false,
      body: SafeArea(
        //   child: WillPopScope(
        //     onWillPop: () async {
        //       return !await Navigator.maybePop(
        //           _tabs[_currentIndex].currentState!.context);
        //     },
        child: IndexedStack(
          index: _currentIndex,
          // children: <Widget>[
          //   NavigatorPage(
          //     title: const Text('Home'),
          //     navigatorKey: _tabs[0],
          //   ),
          // ],
          children: _tabs,
        ),
        //   ),
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
        // currentIndex: _currentIndex,
        // onTap: (int index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // }
      ),
    );
  }
}
