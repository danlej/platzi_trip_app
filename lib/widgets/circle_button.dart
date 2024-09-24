import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleButton extends StatefulWidget {
  bool mini;
  IconData icon;
  double iconSize;
  dynamic color;

  CircleButton(this.mini, this.icon, this.iconSize, this.color, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }
}

class _CircleButton extends State<CircleButton> {
  void onPressedButton() {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
      backgroundColor: widget.color,
      mini: widget.mini,
      onPressed: onPressedButton,
      shape: const CircleBorder(),
      child: Icon(
        widget.icon,
        size: widget.iconSize,
        color: const Color(0xFF4268D3),
      ),
    ));
  }
}
