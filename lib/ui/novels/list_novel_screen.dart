import './novel_creen.dart';
import 'package:flutter/material.dart';
import './novel_manager.dart';


class ListNovel extends StatelessWidget {
  const ListNovel({super.key});

  static const routeName = '/list_novel';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
          height: 800,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 60,
              title: SizedBox(
                height: 38,
                child: TextField(
                  focusNode: FocusNode(),
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: NovelsManager().items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NovelScreen(NovelsManager().items[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
