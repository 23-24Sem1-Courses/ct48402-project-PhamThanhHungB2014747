import 'package:flutter/material.dart';

import '../../models/novel.dart';

class ProductScreen extends StatelessWidget{
  // final Novel novel;
  // ProductScreen({required this.novel});
  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Card(
                      elevation: 5.0, // Độ nổi khối của khung
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://english-e-reader.net/covers/Jojos_Story-Antoinette_Moses_cover.jpg',
                            ),
                            fit: BoxFit.contain,
                            alignment: Alignment.topLeft,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 20,
                      right: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jojo's Story",
                            style: TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 20,
                              fontFamily: 'Recoleta',
                              fontWeight: FontWeight.bold
                              ),
                          ),
                          Text(
                            "Antoinette Moses",
                            style: TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 20,
                              fontFamily: 'Recoleta',
                              // fontWeight: FontWeight.w400
                              ),
                          ),
                          SizedBox(
                            width: 170,
                            // height: 100,
                            child: Text(
                            "Button came into the world in far 1860, it was the last day of the War. He looked like an old, little man. His father was upset and wanted to kill him, but then he exposed him to the hospitage. People around thought that this man was born for suffering, but he had become one of the happiest people in the world. The nature’s anomaly had born him and given the great opportunity – Conversely live. He wasn't getting older like everybody, he was becoming younger the whole his life. He had a hard way, full of sense, friendship, and good people. And the most important – by love. Our hero got acquainted with the world around through communication with old people that’s why he avoided mistakes, which usual people always make.",
                            style: TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 14,
                              fontFamily: 'Recoleta',
                              // fontWeight: FontWeight.w400
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis, // Hiển thị dấu chấm ba chấm khi văn bản vượt quá kích thước
                          ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}