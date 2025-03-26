// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProductRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> addProduct(String name, String price, String quantity) async {
//     try {
//       await _firestore.collection('products').add({
//         'name': name,
//         'price': price,
//         'quantity': quantity,
//         'createdAt': Timestamp.now(),
//       });
//     } catch (e) {
//       throw Exception("Error adding product: $e");
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Product product) async {
    await _firestore
        .collection('products')
        .doc(product.id)
        .set(product.toJson());
  }

  Stream<List<Product>> getProducts() {
    return _firestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
    });
  }
}
