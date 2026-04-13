// ignore_for_file: public_member_api_docs, sort_constructors_first

class ActivityModel {
  final String title;
  final int sets;
  final int repetition;
  final double minutes;
  final String imageUrl;
  final String category;
  ActivityModel({
    required this.title,
    required this.sets,
    required this.repetition,
    required this.minutes,
    required this.imageUrl,
    required this.category,
  });

  ActivityModel copyWith({
    String? title,
    int? sets,
    int? repetition,
    double? minutes,
    String? imageUrl,
    String? category,
  }) {
    return ActivityModel(
      title: title ?? this.title,
      sets: sets ?? this.sets,
      repetition: repetition ?? this.repetition,
      minutes: minutes ?? this.minutes,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'sets': sets,
      'repetition': repetition,
      'minutes': minutes,
      'imageUrl': imageUrl,
      'category': category,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      title: map['title'] as String,
      sets: map['sets'] as int,
      repetition: map['repetition'] as int,
      minutes: map['minutes'] as double,
      imageUrl: map['imageUrl'] as String,
      category: map['category'] as String,
    );
  }
}
