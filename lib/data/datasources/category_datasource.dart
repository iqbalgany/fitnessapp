import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/data/models/category_model.dart';

class CategoryDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    try {
      final snapshot = await _firestore.collection('categories').get();

      return snapshot.docs
          .map((doc) => CategoryModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to retrieve category data: $e');
    }
  }
}
