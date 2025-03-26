import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickshop/core/components/custom_cancel_button.dart';
import 'package:quickshop/core/components/custom_header_text.dart';
import 'package:quickshop/core/components/custom_submit_button.dart';
import 'package:quickshop/core/constants/app_constatnts.dart';

// class AddProductPage extends StatelessWidget {
//   const AddProductPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final addProductKey = GlobalKey<FormState>();
//     final productNameController = TextEditingController();
//     final productPriceController = TextEditingController();
//     final productQuantityController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(defaultPadding),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomHeaderText(text: 'Add Product'),
//             SizedBox(height: defaultPadding),
//             Form(
//               key: addProductKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: productNameController,
//                     decoration: InputDecoration(hintText: 'Name'),
//                     validator: (value) =>
//                         value!.isEmpty ? "Enter product name" : null,
//                   ),
//                   SizedBox(height: defaultPadding / 2),
//                   TextFormField(
//                     controller: productPriceController,
//                     decoration: InputDecoration(hintText: 'Price'),
//                     keyboardType: TextInputType.number,
//                     validator: (value) => value!.isEmpty ? "Enter price" : null,
//                   ),
//                   SizedBox(height: defaultPadding / 2),
//                   TextFormField(
//                     controller: productQuantityController,
//                     decoration: InputDecoration(hintText: 'Quantity'),
//                     keyboardType: TextInputType.number,
//                     validator: (value) =>
//                         value!.isEmpty ? "Enter quantity" : null,
//                   ),
//                   SizedBox(height: defaultPadding),
//                   BlocListener<ProductBloc, ProductState>(
//                     listener: (context, state) {
//                       if (state is ProductSuccess) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("Product added successfully")),
//                         );
//                         productNameController.clear();
//                         productPriceController.clear();
//                         productQuantityController.clear();
//                       } else if (state is ProductFailure) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("Error: ${state.error}")),
//                         );
//                       }
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         // ElevatedButton(
//                         //     onPressed: () {
//                         //       print('=================');
//                         //       if (addProductKey.currentState!.validate()) {
//                         //         context.read<ProductBloc>().add(
//                         //               AddProductEvent(
//                         //                 name: productNameController.text,
//                         //                 price: productPriceController.text,
//                         //                 quantity:
//                         //                     productQuantityController.text,
//                         //               ),
//                         //             );
//                         //       }
//                         //     },
//                         //     child: Text("submit"))
//                         CustomSubmitButton(
//                           function: () {
//                             print('=================');
//                             if (addProductKey.currentState!.validate()) {
//                               context.read<ProductBloc>().add(
//                                     AddProductEvent(
//                                       name: productNameController.text,
//                                       price: productPriceController.text,
//                                       quantity: productQuantityController.text,
//                                     ),
//                                   );
//                             }
//                           },
//                         ),

//                         SizedBox(width: defaultPadding),
//                         CustomCancelButton()
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickshop/features/products/view_model/products_bloc.dart';
import 'package:quickshop/features/products/view_model/products_event.dart';

import '../models/product_model.dart';

class AddProductView extends StatefulWidget {
  @override
  _AddProductViewState createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name")),
            TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number),
            TextField(
                controller: stockController,
                decoration: InputDecoration(labelText: "Stock"),
                keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final product = Product(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameController.text,
                  price: double.parse(priceController.text),
                  stock: int.parse(stockController.text),
                );
                BlocProvider.of<ProductBloc>(context).add(AddProduct(product));
                Navigator.pop(context);
              },
              child: Text("Add Product"),
            ),
          ],
        ),
      ),
    );
  }
}
