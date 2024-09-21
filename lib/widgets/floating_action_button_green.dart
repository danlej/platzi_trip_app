import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  const FloatingActionButtonGreen({super.key});

  @override
  State<StatefulWidget> createState() => _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  bool _pressed = false;

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
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      shape: const CircleBorder(),
      child: _pressed
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
    );
  }
}
