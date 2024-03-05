import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatefulWidget {
  final Color color;
  final Color textColor;
  final double strokeAlign;
  final double strokeWidth;
  final double? value;

  const CustomCircularProgressIndicator({
    super.key,
    required this.color,
    required this.textColor,
    required this.strokeAlign,
    required this.strokeWidth,
    required this.value,
  });

  @override
  State<CustomCircularProgressIndicator> createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            value: widget.value,
            strokeAlign: widget.strokeAlign,
            strokeWidth: widget.strokeWidth,
            color: widget.color,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
              "${((widget.value != null ? widget.value! : 0 * 100).round()).toString()}%",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: widget.textColor, fontSize: widget.strokeAlign * 2)),
        )
      ],
    );
  }
}
