import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';

class TextFieldWidget extends StatelessWidget {

  final String hint;
  final TextEditingController txt;
  final Widget widget;
  final TextInputType type;
  final bool obscure;
  final List<TextInputFormatter> formatter;

  const TextFieldWidget(
      {super.key,
      required this.formatter,
      required this.hint,
      required this.obscure,
      required this.txt,
      required this.type,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        controller: txt,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor:  Colors.deepPurple[300],
        keyboardType: type,
        inputFormatters: formatter,
        validator: (value) {
          //   if (isEmail == true  && (value!.isEmpty|| !value.contains("@") || !value.contains(".")))
          //   {

          //                   return "Please Fill correctly";

          // }

          if (value!.isEmpty) {
            return "Please Fill correctly";
          } else if (value.length < 2) {
            return "must be greater than two characters";
          }
          return null;
        },
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: widget,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color:  Colors.deepPurple),
          ),
          hintText: hint,
          // hintStyle: TextStyle(color:  Colors.deepPurple[300]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color:  Colors.deepPurple),
          ),
        ));

  }
}


    