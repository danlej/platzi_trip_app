import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final Color iconColor;
  final VoidCallback? onPressed;

  const FloatingActionButtonGreen({
    super.key,
    required this.iconData,
    this.iconColor = Colors.white70,
    this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  /* bool _pressed = false;

  void onPressedFav() {
    setState(() {
      _pressed = !_pressed;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _pressed
            ? const Text("Agregaste a tus Favoritos")
            : const Text("Quitaste de tus Favoritos"),
      ),
    );
  } */

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      shape: const CircleBorder(),
      heroTag: null,
      child: Icon(
        widget.iconData,
        color: widget.iconColor,
        shadows: [
          Shadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(2, 2),
            blurRadius: 3,
          )
        ],
      ),
      /* child: _pressed
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border), */
    );
  }
}
