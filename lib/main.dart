import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickshop/core/services/theme_service.dart';
import 'package:quickshop/core/theme/app_theme.dart';
import 'package:quickshop/features/auth/views/login_view.dart';
import 'package:quickshop/features/auth/views/register_view.dart';
import 'package:quickshop/features/home/views/home_view.dart';

import 'package:quickshop/features/products/view_model/products_bloc.dart';
import 'package:quickshop/features/products/view_model/products_event.dart';
import 'package:quickshop/features/products/repositories/product_repositories.dart';
import 'package:quickshop/features/products/views/add_products_page.dart';
import 'package:quickshop/features/products/views/products_list_page.dart';
import 'package:quickshop/features/splash/views/splash_view.dart';
import 'package:quickshop/firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(ChangeNotifierProvider(
//     create: (context) => ThemeProvider(),
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeProvider>(
//       builder: (context, themeProvider, child) => MaterialApp(
//         title: 'Flutter Demo',
//         debugShowCheckedModeBanner: false,
//         themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
//         //themeMode: ThemeMode.dark,

//         theme: AppThemes.lightThemeData,
//         darkTheme: AppThemes.darkThemeData,

//         initialRoute: AppRoutes.home, // Set initial screen
//         routes: AppRoutes.routes,
//       ),
//     );
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductBloc(ProductRepository())..add(FetchProducts()),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          //themeMode: ThemeMode.dark,

          theme: AppThemes.lightThemeData,
          darkTheme: AppThemes.darkThemeData,
          initialRoute: '/',
          routes: {
            '/': (context) => SplashViewWrapper(),
            '/login': (context) => LoginViewWrapper(),
            '/register': (context) => RegisterViewWrapper(),
            '/home': (context) => HomeViewWrapper(),
            "/add_product": (context) => AddProductView(),
            "/product_list": (context) => ProductListView()
          },
        ),
      ),
    );
  }
}
