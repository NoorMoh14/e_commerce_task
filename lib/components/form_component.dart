
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';
class FormComponent extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType textInputType;
  final String? errorText;
  final bool enabled;
  final bool isDense;
  final bool filled;
  final FocusNode? focusNode;
  final Function(String)? onSaved;
  final IconButton? suffixIcon;
  bool obscureText;

   FormComponent({
     super.key,
     this.controller,
     this.textInputAction=TextInputAction.next,
     this.hintText,
     this.isDense = false,
     this.filled  = false,
     this.suffixIcon,
     this.validator,
     this.focusNode,
     this.textInputType = TextInputType.text,
    // required this.controller,
     this.obscureText = false,
     this.errorText,
     this.onSaved,
     this.enabled = true,
    //required  controller,

  });

  @override
  Widget build(BuildContext context)  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
       padding: EdgeInsets.all(5),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        obscureText: obscureText,
        textInputAction: textInputAction,
        textAlign: TextAlign.center,
        maxLines: 1,
        keyboardType: textInputType,
        maxLength: 40,
        focusNode: focusNode,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          isDense: isDense,
          filled: filled,
          fillColor: AppTheme.formColor,
          hintText: hintText,
          errorText: errorText,
          counterText: "",
          hintStyle: const TextStyle(fontSize: 15),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.secondary,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.primary,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.error,
              style: BorderStyle.solid,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.error,
              style: BorderStyle.solid,
            ),
          ),
        ),
        validator: validator,
        // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
        //     (String? value) {
        //   if (value!.isEmpty) {
        //     return errorText;
        //   }
        //   return null;
        // },
        // onSaved: (String? value) {
        //   onSaved?.call(value??'');
        // },
      ),
    );
  }
}
