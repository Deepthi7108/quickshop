// // import 'package:equatable/equatable.dart';

// // abstract class ProductEvent extends Equatable {
// //   @override
// //   List<Object?> get props => [];
// // }

// // class AddProductEvent extends ProductEvent {
// //   final String name;
// //   final String price;
// //   final String quantity;

// //   AddProductEvent(
// //       {required this.name, required this.price, required this.quantity});

// //   @override
// //   List<Object?> get props => [name, price, quantity];
// // }
// import '../models/product_model.dart';

// abstract class ProductEvent {}

// class FetchProducts extends ProductEvent {}

// class AddProduct extends ProductEvent {
//   final Product product;
//   AddProduct(this.product);
// }
import 'package:quickshop/features/products/models/product_model.dart';

abstract class ProductEvent {}

class FetchProducts extends ProductEvent {}

class AddProduct extends ProductEvent {
  final Product product;
  AddProduct(this.product);
}

class ProductLoadedEvent extends ProductEvent {
  final List<Product> products;
  ProductLoadedEvent(this.products);
}

class ProductErrorEvent extends ProductEvent {
  final String message;
  ProductErrorEvent(this.message);
}
