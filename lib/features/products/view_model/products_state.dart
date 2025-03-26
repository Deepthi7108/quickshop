// import 'package:equatable/equatable.dart';

// abstract class ProductState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class ProductInitial extends ProductState {}

// class ProductLoading extends ProductState {}

// class ProductSuccess extends ProductState {}

// class ProductFailure extends ProductState {
//   final String error;

//   ProductFailure(this.error);

//   @override
//   List<Object?> get props => [error];
// }
import '../models/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
