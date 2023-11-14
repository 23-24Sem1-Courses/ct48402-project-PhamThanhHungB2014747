import 'package:ct484_project/ui/novels/list_novel_screen.dart';
import 'package:provider/provider.dart';

import './novel_creen.dart';
import 'package:flutter/material.dart';
import './novel_manager.dart';

class ListLibaryNovel extends StatefulWidget {
  const ListLibaryNovel({super.key});

  static const routeName = '/list_novel';

  @override
  State<ListLibaryNovel> createState() => _ListLibaryNovel();
  // Widget build(BuildContext context) {
  //   return SingleChildScrollView(
  //       child: SizedBox(
  //         height: 800,
  //         child: Scaffold(
  //           body: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 ListView.builder(
  //                   shrinkWrap: true,
  //                   physics: const NeverScrollableScrollPhysics(),
  //                   itemCount: NovelsManager().items.length,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return NovelScreen(NovelsManager().items[index]);
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //   );
  // }
}

class _ListLibaryNovel extends State<ListLibaryNovel> {
  late Future<void> _fetchNovels;
  @override
  void initState() {
    super.initState();
    _fetchNovels = context.read<NovelsManager>().fetchNovels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Libary',
            style: TextStyle(
              color: Color(0xFF393939),
              fontSize: 35,
              fontFamily: 'Recoleta',
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          FutureBuilder(
            future: _fetchNovels,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SingleChildScrollView(
                  child: SizedBox(
                    height: 800,
                    child: Scaffold(
                        // appBar: AppBar(
                        //   elevation: 0,
                        //   backgroundColor: Colors.white,
                        //   toolbarHeight: 60,
                        //   title: SizedBox(
                        //     height: 38,
                        //     child: TextField(
                        //       focusNode: FocusNode(),
                        //       decoration: InputDecoration(
                        //           filled: true,
                        //           fillColor: const Color(0xFFDCDCDC),
                        //           contentPadding: const EdgeInsets.all(0),
                        //           prefixIcon: Icon(
                        //             Icons.search,
                        //             color: Colors.grey.shade500,
                        //           ),
                        //           border: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(50),
                        //               borderSide: BorderSide.none),
                        //           hintStyle: TextStyle(
                        //               fontSize: 14, color: Colors.grey.shade500),
                        //           hintText: "Search name"),
                        //     ),
                        //   ),
                        // ),
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
                onRefresh: () =>
                    context.read<NovelsManager>().fetchNovels(true),
                child: buildNovelListView(),
              );
            },
          ),
        ],
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
