import 'package:flutter/material.dart';
import 'package:souq_app/features/on_boarding_feature/data/models/on_boarding_model.dart';

Widget buildOnBoardingView(OnBoardingModel model) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(model.imagePath, height: 250),
      const SizedBox(height: 20),
      Text(
        model.title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          model.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}
