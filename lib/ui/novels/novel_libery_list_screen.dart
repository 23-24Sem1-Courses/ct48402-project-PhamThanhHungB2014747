import './novel_creen.dart';
import 'package:flutter/material.dart';
import './novel_manager.dart';


class ListLibaryNovel extends StatelessWidget {
  const ListLibaryNovel({super.key});

  static const routeName = '/list_novel';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
          height: 800,
          child: Scaffold(
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
