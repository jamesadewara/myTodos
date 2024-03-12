import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DecoratedCard extends StatelessWidget {
  const DecoratedCard(
      {super.key,
      required this.value,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.onChanged,
      required this.groupValue});
  final bool value;
  final String title;
  final String subtitle;
  final String image;
  final Object groupValue;
  final Function(Object?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 220,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: value
                ? Border.all(color: Theme.of(context).primaryColor)
                : Border.all(color: Colors.transparent),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.background,
              Theme.of(context).scaffoldBackgroundColor
            ]),
            borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            onChanged(value);
          },
          child: Column(children: [
            Align(
              alignment: Alignment.centerRight,
              child: Radio(
                  value: value, groupValue: groupValue, onChanged: onChanged),
            ),
            Center(
              child: Image.asset(
                image,
                width: 160,
                height: 160,
              ),
            ),
            ListTile(
              title: AutoSizeText(title),
              subtitle: subtitle.isNotEmpty
                  ? Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  : null,
            )
          ]),
        ));
  }
}
