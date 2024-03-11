import 'package:flutter/material.dart';

class LabelComponent extends StatelessWidget {
  final String? text;
  const LabelComponent({super.key,this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(right:10,top: 10),
      width: double.infinity,
      child:  Text(text!,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
