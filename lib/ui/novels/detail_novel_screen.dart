import '../../models/novel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailNovelScreen extends StatefulWidget {
  static const routeName = '/novel-detail';
  DetailNovelScreen(this.novel, {super.key});

  final Novel novel;

  @override
  _Mydetail createState() => _Mydetail(novel);
}

class _Mydetail extends State<DetailNovelScreen> {
  String selectedOption = 'About';

  _Mydetail(this.novel);

  final Novel novel;

  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          novel.name,
          style: const TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 20,
            decoration: TextDecoration.none,
            fontFamily: 'Recoleta',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            // color: Colors.grey[200],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    novel.imageUrl,
                    height: 300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    novel.name,
                    style: const TextStyle(
                      color: Color(0xFF393939),
                      fontSize: 25,
                      fontFamily: 'Recoleta',
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    novel.author,
                    style: const TextStyle(
                      color: Color(0xFF393939),
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      fontFamily: 'Recoleta',
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = 'About';
                          });
                        },
                        child: Text(
                          'About',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Recoleta',
                            decoration: TextDecoration.none,
                            fontWeight: selectedOption == 'About'
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: selectedOption == 'About'
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = 'Chapter';
                          });
                        },
                        child: Text(
                          'Chapter',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Recoleta',
                            decoration: TextDecoration.none,
                            fontWeight: selectedOption == 'Chapter'
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: selectedOption == 'Chapter'
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              selectedOption == 'About'
                  ? buildAbout(novel.description)
                  : buildChapter(novel.countChapter),
              // Positioned(
              //   // Đặt vị trí của nút "Save" tại góc phải trên cùng
              //   top: 100,
              //   right:50,
              //   child: IconButton(
              //     icon: Icon(
              //       isSaved ? Icons.bookmark : Icons.bookmark_border,
              //       color: Colors.black,
              //     ),
              //     onPressed: () {
              //       setState(() {
              //         isSaved = !isSaved;
              //       });
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAbout(String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Text(
          description,
          style: const TextStyle(
            fontSize: 16.0,
            fontFamily: 'Recoleta',
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  Widget buildChapter(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10, top: 15),
      child: Column(
        children: List.generate(index, (temp) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
                // style: style,
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0XFFBBBBBB)),
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 60.0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'Chapter $temp',
                      style: const TextStyle(
                        color: Color(0xFF001524),
                        fontSize: 25,
                        fontFamily: 'Recoleta',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
          );
        }),
      ),
    );
  }
}
