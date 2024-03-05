import 'package:flutter/material.dart';

class FileField extends StatefulWidget {
  final String title;
  final BoxDecoration? decoration;
  final String? hintText;
  final VoidCallback onTap;

  const FileField({
    super.key,
    required this.title,
    required this.decoration,
    required this.hintText,
    required this.onTap,
  });

  @override
  State<FileField> createState() => _FileFieldState();
}

class _FileFieldState extends State<FileField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decoration,
      child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: FilledButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).primaryColor),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.white)),
                      onPressed: widget.onTap,
                      child: Text(
                        widget.hintText ?? "Choose a file",
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                      )),
                ),
                const SizedBox(
                  width: 4,
                ),
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                    )
                  ],
                ))
              ])),
    );
  }
}
