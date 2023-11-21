import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50.0,
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Theme.of(context).primaryColor,
        shadows: [
          Shadow(
              color: Theme.of(context).primaryColor,
              offset: const Offset(5.0, 5.0),
              blurRadius: 15.0,
          ),
        ],
      ),
    );
  }
}
