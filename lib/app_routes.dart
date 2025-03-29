import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quickshop/features/products/repositories/product_repositories.dart';
import 'package:quickshop/features/products/view_model/products_bloc.dart';
import 'package:quickshop/features/products/views/add_products_page.dart';
import 'package:quickshop/features/products/views/products_list_page.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String settings = '/settings';
  static const String products_list = '/products_list';
  static const String products_list_wrapper = '/products_list_wrapper';
  static const String add_product = '/add_product';

  static Map<String, WidgetBuilder> routes = {
    //home: (context) => HomeScreen(),
    products_list: (context) => ProductListView(),
    //  products_list_wrapper: (context) => ProductListWrapper(),
    add_product: (context) => BlocProvider(
          create: (context) => ProductBloc(ProductRepository()),
          //ProductBloc(repositories: ProductRepository()),
          child: AddProductView(),
        ),
    // login: (context) => LoginScreen(),
    // settings: (context) => SettingsScreen(),
  };
}
