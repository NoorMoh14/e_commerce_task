import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Function()? onPress;
  final String text;
  final double width;
  final Color? customColor;

  const ButtonComponent({super.key,
    required this.text,
    this.onPress,
    this.width = double.infinity,
    this.customColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ).merge(
          ButtonStyle(
            backgroundColor: MaterialStateProperty.all(customColor),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
