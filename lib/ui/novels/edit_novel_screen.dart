// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/novel.dart';
import 'novel_manager.dart';
import '../customdialog.dart';

class EditNovelScreen extends StatefulWidget {
  static const routeName = '/edit-novel';
  EditNovelScreen(
    Novel? novel, {
    super.key,
  }) {
    if (novel == null) {
      this.novel = Novel(
        id: null,
        name: '',
        author: '',
        description: '',
        countChapter: 0,
        imageUrl: '',
      );
    } else {
      this.novel = novel;
    }
  }

  late final Novel novel;

  @override
  State<EditNovelScreen> createState() => _EditNovelScreenState();
}

class _EditNovelScreenState extends State<EditNovelScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
  late Novel _editedNovel;
  var _isLoading = false;

  bool _isValidImageUrl(String value) {
    return (value.startsWith('http') || value.startsWith('https')) &&
        (value.endsWith('.png') ||
            value.endsWith('.jpg') ||
            value.endsWith('.jpeg'));
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(() {
      if (!_imageUrlFocusNode.hasFocus) {
        if (!_isValidImageUrl(_imageUrlController.text)) {
          return;
        }
        setState(() {});
      }
    });
    _editedNovel = widget.novel;
    _imageUrlController.text = _editedNovel.imageUrl;
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Novel'),
        actions: <Widget>[
          IconButton(
            onPressed: _saveForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _editForm,
                child: ListView(
                  children: <Widget>[
                    buildTitleField(),
                    buildAuthorField(),
                    buildCountField(),
                    buildDescriptionField(),
                    buildNovelPreview(),
                  ],
                ),
              ),
            ),
    );
  }

  TextFormField buildTitleField() {
    return TextFormField(
      initialValue: _editedNovel.name,
      decoration: const InputDecoration(labelText: 'Name'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value';
        }
        return null;
      },
      onSaved: (value) {
        _editedNovel = _editedNovel.copyWith(name: value);
      },
    );
  }

  TextFormField buildAuthorField() {
    return TextFormField(
      initialValue: _editedNovel.author,
      decoration: const InputDecoration(labelText: 'Author'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a author';
        }
        // if (value.length < 10) {
        //   return 'Should be at least 10 characters long';
        // }
        return null;
      },
      onSaved: (value) {
        _editedNovel = _editedNovel.copyWith(author: value);
      },
    );
  }

  Future<void> _saveForm() async {
    final isValid = _editForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _editForm.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    try {
      final novelsManager = context.read<NovelsManager>();
      if (_editedNovel.id != null) {
        // print(_editedNovel.countChapter);
        await novelsManager.updateNovel(_editedNovel);
      } else {
        await novelsManager.addNovel(_editedNovel);
      }
    } catch (error) {
      await showErrorDialog(context, 'Something went wrong');
    }

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  TextFormField buildDescriptionField() {
    return TextFormField(
      initialValue: _editedNovel.description,
      decoration: const InputDecoration(labelText: 'Description'),
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a description';
        }
        // if (value.length < 20) {
        //   return 'Should be at least 10 characters long';
        // }
        return null;
      },
      onSaved: (value) {
        _editedNovel = _editedNovel.copyWith(description: value);
      },
    );
  }

  TextFormField buildCountField() {
    return TextFormField(
      initialValue: _editedNovel.countChapter.toString(),
      decoration: const InputDecoration(labelText: 'Chapter'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a chapter';
        }
        if (int.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        if (int.parse(value) <= 0) {
          return 'Please enter a number greater than zero';
        }
        return null;
      },
      onSaved: (value) {
        // print(int.parse(value!));
        _editedNovel = _editedNovel.copyWith(countChapter: int.tryParse(value!));
        print(_editedNovel.countChapter);
      },
    );
  }

  Widget buildNovelPreview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(
            top: 8,
            right: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _imageUrlController.text.isEmpty
              ? const Text('Enter a URL')
              : FittedBox(
                  child: Image.network(
                    _imageUrlController.text,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Expanded(
          child: buildImageURLField(),
        ),
      ],
    );
  }

  TextFormField buildImageURLField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Image URL'),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      controller: _imageUrlController,
      focusNode: _imageUrlFocusNode,
      onFieldSubmitted: (value) => _saveForm(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an image URL';
        }
        if (!_isValidImageUrl(value)) {
          return 'Please enter a valid image URL';
        }
        return null;
      },
      onSaved: (value) {
        _editedNovel = _editedNovel.copyWith(imageUrl: value);
      },
    );
  }
}
