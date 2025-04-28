// import 'package:flutter/material.dart';
// import 'package:souq_app/core/utils/assets_paths.dart';

// class CustomTestWidgets extends StatelessWidget {
//   const CustomTestWidgets({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: ClipPath(
//           clipper: TopBottomLeftClipper(),
//           child: Container(
//             color: Colors.blue,
//             width: 300,
//             height: 200,
//             child: Center(child: Text('Clipped!', style: TextStyle(color: Colors.white))),
//           ),
//         ),
//       );
//   }
// }



// class TopBottomLeftClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(0, 0); // Start from top-left
//     path.lineTo(-10, 0); // Move to top-right
//     path.lineTo(size.width, 10); // Move to bottom-right
//     path.lineTo(0, -10); // Move to bottom-left
//     path.lineTo(0, 0); // Back to top-left
//     return path;
//   }
//    @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }