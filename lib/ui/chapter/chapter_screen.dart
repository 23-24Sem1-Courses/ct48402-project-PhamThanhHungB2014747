// import '../../models/chapter.dart';
import 'package:flutter/material.dart';

import '../chapter/chapter_manager.dart';

class ChapterScreen extends StatefulWidget {
  final int idChapter;
  const ChapterScreen(this.idChapter, String? id, {Key? key}) : super(key: key);

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  String? get id => null;
  ChaptersManager _chaptersManager = ChaptersManager();

  bool _shouldReload = false;
  int currentChapter = 0;
   final _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    _initializeChaptersManager();
    currentChapter = widget.idChapter;
  }

  void _initializeChaptersManager() async {
    _chaptersManager = ChaptersManager();
    await _chaptersManager.fetchChapters(id ?? "");
    _shouldReload = true;
    setState(() {
      _shouldReload = true;
    });
  }

  void _incrementChapter() {
    setState(() {
      if (_chaptersManager.items.chapterCount > currentChapter + 1)
        currentChapter++;
        _scrollToTop();// Tăng giá trị widget.idChapter lên 1
    });
  }

  void _decrementChapter() {
    setState(() {
      if (currentChapter > 1) {
        currentChapter--; 
        _scrollToTop();// Giảm giá trị widget.idChapter đi 1
      }
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(_chaptersManager.items.chapterCount);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Chapter $currentChapter',
          style: const TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 20,
            decoration: TextDecoration.none,
            fontFamily: 'Recoleta',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_left),
            onPressed: _decrementChapter,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_right),
            onPressed: _incrementChapter,
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Text(
            _shouldReload == true
                ? _chaptersManager.items.chapterContent[currentChapter]
                : '',
            style: const TextStyle(
              color: Color(0xFF393939),
              fontSize: 17,
              fontFamily: 'Recoleta',
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
