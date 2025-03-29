import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickshop/features/Category/models/category_model.dart';

class CategoryRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addCategoryRepo(CategoryModel category) async {
    await _firestore
        .collection('categories')
        .doc(category.id)
        .set(category.toJson());
  }

  Stream<List<CategoryModel>> getCategories() {
    return _firestore.collection('categories').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data()))
          .toList();
    });
  }
}
