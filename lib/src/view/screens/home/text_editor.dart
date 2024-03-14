import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/control/routers/props.dart';

class TextEditor extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const TextEditor({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
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
          title: Text(
            context.tr("textEditorTitle"),
            softWrap: true,
          ),
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
