import 'package:flutter/material.dart';

import '../../models/novel.dart';
import './detail_novel_screen.dart';

class NovelScreen extends StatelessWidget {
  const NovelScreen(this.novel, {super.key});

  final Novel novel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailNovelScreen(novel)),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F8FF),
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              novel.imageUrl,
                            ),
                            fit: BoxFit.contain,
                            alignment: Alignment.topLeft,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            novel.name,
                            style: const TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 20,
                              fontFamily: 'Recoleta',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            novel.author,
                            style: const TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 20,
                              fontFamily: 'Recoleta',
                            ),
                          ),
                          SizedBox(
                            width: 170,
                            child: Text(
                              novel.description,
                              style: const TextStyle(
                                color: Color(0xFF393939),
                                fontSize: 14,
                                fontFamily: 'Recoleta',
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
