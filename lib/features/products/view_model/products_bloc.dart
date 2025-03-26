// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quickshop/features/products/bloc/products_event.dart';
// import 'package:quickshop/features/products/bloc/products_state.dart';
// import 'package:quickshop/features/products/repositories/product_repositories.dart';

// // class ProductBloc extends Bloc<ProductEvent, ProductState> {
// //   final ProductRepository productRepository;

// //   ProductBloc({required this.productRepository}) : super(ProductInitial()) {
// //     on<AddProductEvent>(_onAddProduct);
// //   }

// //   void _onAddProduct(AddProductEvent event, Emitter<ProductState> emit) async {
// //     emit(ProductLoading());
// //     try {
// //       await productRepository.addProduct(
// //           event.name, event.price, event.quantity);
// //       emit(ProductSuccess());
// //     } catch (e) {
// //       emit(ProductFailure(e.toString()));
// //     }
// //   }
// // }
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   final ProductRepository _repository;

//   ProductBloc(this._repository) : super(ProductInitial()) {
//     on<FetchProducts>((event, emit) async {
//       emit(ProductLoading());
//       try {
//         _repository.getProducts().listen((products) {
//           emit(ProductLoaded(products));
//         });
//       } catch (e) {
//         emit(ProductError("Failed to load products"));
//       }
//     });

//     on<AddProduct>((event, emit) async {
//       try {
//         await _repository.addProduct(event.product);
//       } catch (e) {
//         emit(ProductError("Failed to add product"));
//       }
//     });
//   }
// }
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickshop/features/products/view_model/products_event.dart';
import 'package:quickshop/features/products/view_model/products_state.dart';
import 'package:quickshop/features/products/repositories/product_repositories.dart';
import '../models/product_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;
  StreamSubscription<List<Product>>? _productSubscription;

  ProductBloc(this._repository) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        _productSubscription?.cancel(); // Cancel any existing subscription
        _productSubscription = _repository.getProducts().listen(
          (products) {
            add(ProductLoadedEvent(products));
          },
          onError: (error) {
            add(ProductErrorEvent("Failed to load products"));
          },
        );
      } catch (e) {
        emit(ProductError("Failed to load products"));
      }
    });

    on<ProductLoadedEvent>((event, emit) {
      emit(ProductLoaded(event.products));
    });

    on<ProductErrorEvent>((event, emit) {
      emit(ProductError(event.message));
    });

    on<AddProduct>((event, emit) async {
      try {
        await _repository.addProduct(event.product);
      } catch (e) {
        emit(ProductError("Failed to add product"));
      }
    });
  }

  @override
  Future<void> close() {
    _productSubscription?.cancel(); // Cleanup subscription on bloc close
    return super.close();
  }
}
