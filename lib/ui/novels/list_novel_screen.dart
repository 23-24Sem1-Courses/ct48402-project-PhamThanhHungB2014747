import 'package:provider/provider.dart';
import './novel_creen.dart';
import 'package:flutter/material.dart';
import './novel_manager.dart';
import '../screens.dart';
// import '../../models/novel.dart';

class ListNovel extends StatefulWidget {
  const ListNovel({super.key});
  // static const routeName = '/list_novel';
  @override
  State<ListNovel> createState() => _ListNovel();
}

class _ListNovel extends State<ListNovel> {
  late Future<void> _fetchNovels;
  @override
  void initState() {
    super.initState();
    _fetchNovels = context.read<NovelsManager>().fetchNovels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 38,
          child: TextField(
            focusNode: FocusNode(),
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFDCDCDC),
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: "Search name"),
          ),
        ),
        // actions: [
        //   buildSlider(),
        // ],
      ),
      body: FutureBuilder(
        future: _fetchNovels,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SingleChildScrollView(
              child: SizedBox(
                height: 800,
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    toolbarHeight: 60,
                  ),
                ),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => context.read<NovelsManager>().fetchNovels(true),
            child: buildNovelListView(),
          );
        },
      ),
    );
  }

  // Widget buildSlider() {
  //   double _currentSliderValue = 0;
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Slider(
  //             value: _currentSliderValue,
  //             min: 0,
  //             max: 100,
  //             onChanged: (double value) {
  //               setState(() {
  //                 _currentSliderValue = value;
  //               });
  //             },
  //           ),
  //           Text(
  //             'Slider value: $_currentSliderValue',
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

Widget buildNovelListView() {
  return Consumer<NovelsManager>(
    builder: (ctx, novelsManager, child) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: novelsManager.itemCount,
        itemBuilder: (BuildContext context, int index) {
          return NovelScreen(novelsManager.items[index]);
        },
      );
    },
  );
}
