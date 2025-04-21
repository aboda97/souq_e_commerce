import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeActiveItem extends StatelessWidget {
  const DeActiveItem({super.key, required this.imagePath});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Image.asset(imagePath),
    );
  }
}