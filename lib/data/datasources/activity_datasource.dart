import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/data/models/activity_model.dart';

class ActivityDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ActivityModel>> getActivitiesByCategory(
    String categoryName,
  ) async {
    try {
      final snapshot = await _firestore
          .collection('activities')
          .where('category', isEqualTo: categoryName)
          .get();

      return snapshot.docs
          .map((doc) => ActivityModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to retrieve activity data: $e');
    }
  }

  Future<List<ActivityModel>> getAllActivities() async {
    try {
      final snapshot = await _firestore.collection('activities').get();

      return snapshot.docs
          .map((doc) => ActivityModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to retrieve activity data: $e');
    }
  }
}
