import 'package:flutter/material.dart';
import '../../models/novel.dart';

class NovelSearchPage extends StatefulWidget {
  @override
  _NovelSearchPageState createState() => _NovelSearchPageState();
}

class _NovelSearchPageState extends State<NovelSearchPage> {
  String _searchText = '';
  List<Novel> _searchResults = [];

  void _performSearch(String searchText) {
    setState(() {
      _searchText = searchText;
      _searchResults = novels
          .where((novel) =>
              novel.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: _performSearch,
            decoration: const InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final product = _searchResults[index];
                return ListTile(
                  title: Text(product.name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductSearchPage(),
  ));
}
