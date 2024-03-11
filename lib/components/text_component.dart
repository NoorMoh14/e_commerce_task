import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String? text;
  final TextAlign textAlign;
  final TextStyle? textStyle;

  const TextComponent({
    Key?key,
    required this.text,
    this.textStyle,
    this.textAlign = TextAlign.center,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      style: textStyle ?? Theme.of(context).textTheme.bodySmall,
    );
  }
}
