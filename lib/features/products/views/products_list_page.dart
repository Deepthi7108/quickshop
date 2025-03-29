import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickshop/app_routes.dart';
import 'package:quickshop/core/components/custom_drawer.dart';
import 'package:quickshop/core/components/custom_header_text.dart';
import 'package:quickshop/core/constants/app_constatnts.dart';
import 'package:quickshop/features/products/view_model/products_bloc.dart';
import 'package:quickshop/features/products/view_model/products_event.dart';
import 'package:quickshop/features/products/view_model/products_state.dart';
import 'package:quickshop/features/products/repositories/product_repositories.dart';

// class ProductListWrapper extends StatelessWidget {
//   const ProductListWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProductBloc(productRepository: ProductRepository()),
//       child: ProductsListPage(),
//     );
//   }
// }

// class ProductsListPage extends StatelessWidget {
//   const ProductsListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;

//     return Scaffold(
//       appBar: AppBar(),
//       drawer: CustomDrawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(defaultPadding),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomHeaderText(text: 'Products'),
//             SizedBox(
//               height: defaultPadding,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: 5,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('Product1'),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.pushNamed(context, AppRoutes.add_product);
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product_model.dart';

class ProductListView extends StatelessWidget {
  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            if (state.products.isEmpty) {
              return Center(child: Text("No products available."));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                Product product = state.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle:
                      Text("\$${product.price} - Stock: ${product.stock}"),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/add_product"),
        child: Icon(Icons.add),
      ),
    );
  }
}

// class ProductListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Products")),
//       body: BlocBuilder<ProductBloc, ProductState>(
//         builder: (context, state) {
//           if (state is ProductLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is ProductLoaded) {
//             print('--------------');
//             return ListView.builder(
//               shrinkWrap: true,
//               itemCount: state.products.length,
//               itemBuilder: (context, index) {
//                 Product product = state.products[index];
//                 return ListTile(
//                   title: Text(product.name),
//                   subtitle:
//                       Text("\$${product.price} - Stock: ${product.stock}"),
//                 );
//               },
//             );
//           } else if (state is ProductError) {
//             return Center(child: Text(state.message));
//           }
//           return Center(child: Text("No products available"));
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.pushNamed(context, "/add_product"),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
