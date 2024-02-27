import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;
  final String subtitle;
  const Heading({super.key, required this.title, required this.subtitle});

  @override
  Row build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AutoSizeText(title,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
        IconButton(
            iconSize: 16,
            splashColor: Theme.of(context).colorScheme.primaryContainer,
            onPressed: () {},
            icon: AutoSizeText(subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary)))
      ],
    );
  }
}
