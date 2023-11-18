import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({super.key});

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedNovel = '';
  final List<String> _novels = [
    "Forrest Gump",
    'Peter Pan',
    'Jaws',
    // Thêm các sản phẩm khác vào đây
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _typeAheadController,
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            suggestionsCallback: (pattern) async {
              return _novels
                  .where((novel) =>
                      novel.toLowerCase().contains(pattern.toLowerCase()))
                  .toList();
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (suggestion) {
              setState(() {
                _typeAheadController.text = suggestion;
                _selectedNovel = suggestion;
              });
            },
          ),
          Text('Selected Novel: $_selectedNovel'),
        ],
      ),
    );
  }
}
