import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_view/flutter_list_view.dart';

class DropdownModalController {
  final Key? key;
  final String? image;
  final String title;
  final String? subtitle;

  const DropdownModalController(
      {this.key, this.image, required this.title, required this.subtitle});
}

class DropdownModal extends StatefulWidget {
  final List<DropdownModalController> options;
  final VoidCallback onSelected;

  final bool isSearchable;
  final String? hintText;
  final TextEditingController? controller;

  const DropdownModal(
      {super.key,
      required this.options,
      this.isSearchable = true,
      this.controller,
      this.hintText,
      required this.onSelected});

  @override
  State<DropdownModal> createState() => _DropdownModalState();
}

class _DropdownModalState extends State<DropdownModal> {
  int initialIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 160,
        height: 300,
        child: Column(
          children: [
            Center(
              child: SearchBar(
                  controller: widget.controller,
                  elevation: MaterialStateProperty.all(0),
                  hintText: widget.hintText,
                  hintStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.grey)),
                  leading: const Icon(Icons.search),
                  onChanged: (String value) {},
                  shape:
                      MaterialStateProperty.all(const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ))),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Divider(),
            ),
            FlutterListView.separated(
              itemCount: widget.options.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    onTap: () {
                      setState(() {
                        initialIndex = index;
                      });
                    },
                    leading: CachedNetworkImage(
                        imageUrl: widget.options.elementAt(index).image ?? "",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const Center(),
                        errorWidget: (context, url, error) => const Center()),
                    title: Text(widget.options.elementAt(index).title),
                    subtitle:
                        Text(widget.options.elementAt(index).subtitle ?? ""),
                    key: widget.options.elementAt(index).key);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )
          ],
        ));
  }
}
