// import 'package:flutter/material.dart';


// Route _getPageRoutes({required String routeName, required Widget screen}) {
//   return MaterialPageRoute(
//     settings: RouteSettings(name: routeName),
//     builder: (_) => screen,
//   );
// }

// Route<dynamic> generateRoute(RouteSettings settings) {
//   // switch (settings.name) {
//   //   case Routes.feed:
//   //     return _getPageRoutes(
//   //       routeName: settings.name!,
//   //       screen: const FeedScreen(),
//   //     );
//     //  case Routes.profile:
//     // final client = settings.arguments! as Client;
//     // return _getPageRoutes(
//     //   routeName: settings.name!,
//     //   screen: ProfileScreen(client: client),
//     // );

//     default:
//       return MaterialPageRoute(
//         builder: (_) => Scaffold(
//           body: Center(
//             child: Text(
//               "No Route defind for ${settings.name}",
//             ),
//           ),
//         ),
//       );
//   }
// }
