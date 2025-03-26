// import 'package:flutter/material.dart';
// import 'package:quickshop/app_routes.dart';
// import 'package:quickshop/core/components/custom_drawer.dart';
// import 'package:quickshop/core/constants/app_constatnts.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       appBar: AppBar(),
//       drawer: CustomDrawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(defaultPadding),
//         child: Row(
//           children: [
//             InkResponse(
//               onTap: () {
//                 Navigator.pushNamed(context, AppRoutes.products_list_wrapper);
//               },
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.1,
//                 width: MediaQuery.of(context).size.width * 0.1,
//                 decoration: BoxDecoration(
//                     color: colorScheme.tertiary.withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(defaultPadding)),
//                 child: Center(child: Text('Products')),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
