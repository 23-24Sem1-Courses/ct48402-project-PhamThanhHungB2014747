import 'package:ct484_project/models/novel.dart';
import 'package:provider/provider.dart';
// import '../screens.dart';
import './novel_creen.dart';
import 'package:flutter/material.dart';
import './novel_manager.dart';
import '../screens.dart';

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
                            hintStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade500),
                            hintText: "Search name"),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          // body: SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       ListView.builder(
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemCount: NovelsManager().items.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return NovelScreen(NovelsManager().items[index]);
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          return RefreshIndicator(
            onRefresh: () => context.read<NovelsManager>().fetchNovels(true),
            child: buildNovelListView(),
          );
        },
      ),
    );
  }
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
