// import 'package:flutter/material.dart';
// import 'package:web_navigation_demo/components/sidebar.dart';
// import 'package:web_navigation_demo/components/topbar.dart';

// class RootLayout extends StatelessWidget {
//   final Widget child;

//   const RootLayout({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: Row(
//         children: [
//           const Sidebar(),
//           Expanded(
//             child: Column(
//               children: [
//                 const Topbar(),
//                 Expanded(
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 35),
//                     padding: const EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: child,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
