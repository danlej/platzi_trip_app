import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  late UserBloc userBloc;

  void onPressedButton() {
    userBloc.signOut();
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return Expanded(
        child: FloatingActionButton(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.6),
      mini: true,
      onPressed: onPressedButton,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.exit_to_app,
        size: 20.0,
        color: Color(0xFF4268D3),
      ),
    ));
  }
}
