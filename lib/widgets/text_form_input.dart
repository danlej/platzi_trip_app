import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final String hintText;
  final TextInputType? inputType;
  final TextEditingController controller;
  final int maxLines;
  final String validatorMessage;

  const TextFormInput(
      {super.key,
      required this.hintText,
      this.inputType,
      required this.controller,
      this.maxLines = 1,
      this.validatorMessage = 'Please enter some text'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        style: const TextStyle(
            fontSize: 15.0,
            fontFamily: "Lato",
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFE5E5E5),
          border: InputBorder.none,
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE5E5E5)),
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE5E5E5)),
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return validatorMessage;
          }
          return null;
        },
      ),
    );
  }
}
