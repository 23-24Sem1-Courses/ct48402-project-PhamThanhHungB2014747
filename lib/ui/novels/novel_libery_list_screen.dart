import 'package:provider/provider.dart';
import './novel_creen.dart';
import 'package:flutter/material.dart';
import './novel_manager.dart';
import '../../models/novel.dart';

class ListLibaryNovel extends StatefulWidget {
  const ListLibaryNovel({super.key});
  static const routeName = '/list_novel';
  @override
  State<ListLibaryNovel> createState() => _ListLibaryNovel();
}

class _ListLibaryNovel extends State<ListLibaryNovel> {
  // final _showInLibrary = ValueNotifier<bool>(true);
  late final Novel novel;
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
                // return const SingleChildScrollView(
                //   child: SizedBox(
                //     height: 800,
                //     child: Scaffold(),
                //   ),
                // );
                return ValueListenableBuilder<bool>(
                  valueListenable: novel.inLibraryListenable,
                  builder: (context, inLibrary, child) {
                    return const SingleChildScrollView(
                      child: SizedBox(
                        child: Scaffold(),
                      ),
                    );
                  },
                );
              }
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
