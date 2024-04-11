import 'package:flutter/material.dart';

class CircleWithDropdown extends StatelessWidget {
  const CircleWithDropdown(
      {super.key, required this.color, required this.icon});

  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 13,
      child: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
