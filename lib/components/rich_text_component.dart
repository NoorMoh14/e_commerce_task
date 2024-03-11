
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextComponent extends StatelessWidget {
  void Function()? onTap;
  final String text;
  final String clickableText;
  final Color color;
  final TextDecoration textDecoration;

   RichTextComponent({
    super.key,
    this.onTap,
    required this.text,
    required this.clickableText,
    this.color = const Color(0xFFEC2486),
    this.textDecoration = TextDecoration.none,


  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
            text: text,
            //'Don\'t have an account? '
            style: Theme.of(context).textTheme.bodySmall,
            children: <TextSpan>[
              TextSpan(
                  text: clickableText,
                  //'Create New One!'
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                    decoration: textDecoration,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = onTap,
              )
            ]
        ),
      ),
    );
  }
}
