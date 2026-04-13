// ignore_for_file: public_member_api_docs, sort_constructors_first

class CategoryModel {
  final String title;
  final int exercises;
  final double minutes;
  final String imageUrl;
  CategoryModel({
    required this.title,
    required this.exercises,
    required this.minutes,
    required this.imageUrl,
  });

  CategoryModel copyWith({
    String? title,
    int? exercises,
    double? minutes,
    String? imageUrl,
  }) {
    return CategoryModel(
      title: title ?? this.title,
      exercises: exercises ?? this.exercises,
      minutes: minutes ?? this.minutes,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'exercises': exercises,
      'minutes': minutes,
      'imageUrl': imageUrl,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'] as String,
      exercises: map['exercises'] as int,
      minutes: map['minutes'] as double,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
