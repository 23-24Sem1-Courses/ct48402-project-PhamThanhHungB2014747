import 'package:ct484_project/ui/novels/product_creen.dart';
import 'package:flutter/material.dart';
import '../../models/novel.dart';


class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 00.0),
    // child: abc(),
    child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        title: SizedBox(
          height: 38,
          
          child: TextField(
            // onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFDCDCDC),
              contentPadding: const EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500
              ),
              hintText: "Search users"
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          ProductScreen(),
        ],
      ),
    ),
  );
}
Widget abc(BuildContext context){
  return Scaffold(
    appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[850],
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500
              ),
              hintText: "Search users"
            ),
          ),
        ),
      ),
  );
}
}