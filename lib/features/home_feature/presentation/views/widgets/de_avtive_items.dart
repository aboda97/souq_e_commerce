import 'package:flutter/material.dart';

class DeActiveItem extends StatelessWidget {
  const DeActiveItem({super.key, required this.imagePath});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      color: Colors.transparent,
      child: Image.asset(imagePath),
    );
  }
}