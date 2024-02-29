import 'package:flutter/material.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({
    super.key,
  });

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  final _scrollController = ScrollController();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Text Editor: Description"),
        ),
        body: Scrollbar(
            controller: _scrollController,
            notificationPredicate: (ScrollNotification notification) {
              return notification.depth == 0;
            },
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Center(
                  child: Expanded(
                      child: TextField(
                controller: _textController,
                maxLines: null,
              ))),
            )));
  }
}