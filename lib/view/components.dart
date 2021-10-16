import 'package:flutter/material.dart';
import 'package:wasata/view/constant.dart';

Widget DefaultButton({
  double width = double.infinity,
  Color color = primaryColor,
  required VoidCallback function,
  required String text,
}) => Container(
  width: width,
  child: MaterialButton(
    onPressed: function,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)),
    color: color,
    minWidth: double.infinity,
    height: 50.0,
    child: Text(
      '$text',
      style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    ),
  ),
);

Widget DefaultTextFormField({
required TextInputType type,
TextEditingController? controller,
FormFieldValidator<String>? validate,
required String hintText,
IconData? prefix,
IconData? suffix,
VoidCallback? suffixPressed,
bool isPassword = false,

}) => TextFormField(
  keyboardType: type,
  controller: controller,
  validator: validate,
  obscureText: isPassword,
  decoration: InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 20),
    prefixIcon: Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 10.0),
      child: Icon(prefix),
    ),
    suffixIcon: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: IconButton(onPressed: suffixPressed, icon: Icon(suffix),),
    ),
    hintText: hintText,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0)
    ),
  ),
);