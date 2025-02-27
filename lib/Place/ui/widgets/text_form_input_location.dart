import 'package:flutter/material.dart';

class TextFormInputLocation extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final String validatorMessage;

  const TextFormInputLocation(
      {super.key,
      required this.hintText,
      required this.iconData,
      required this.controller,
      this.validatorMessage = 'Please enter some text'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black12, blurRadius: 15.0, offset: Offset(0.0, 7.0))
      ]),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
            fontSize: 15.0,
            fontFamily: "Lato",
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(iconData),
          suffixIconColor: Colors.grey,
          fillColor: const Color(0xFFFFFFFF),
          filled: true,
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
