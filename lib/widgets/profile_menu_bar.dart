import 'package:flutter/material.dart';

class ProfileMenuBar extends StatelessWidget {
  const ProfileMenuBar({super.key});

  void onPressed() {}

  Widget createIconButton(IconData iconData, {bool active = false}) {
    return Container(
      height: active ? 65 : 40,
      width: active ? 65 : 40,
      decoration: BoxDecoration(
          color: active ? Colors.white : Colors.white54,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white12, width: 2.0)),
      child: IconButton(
          icon: Icon(iconData),
          onPressed: onPressed,
          iconSize: active ? 45 : 20,
          color: const Color(0xFF4268D3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 225.0),
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          createIconButton(Icons.bookmark_outline),
          createIconButton(Icons.card_giftcard),
          createIconButton(Icons.add, active: true),
          createIconButton(Icons.email_outlined),
          createIconButton(Icons.person)
        ],
      ),
    );
  }
}
