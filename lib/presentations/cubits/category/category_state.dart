// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_cubit.dart';

enum CategoryStatus { initial, loading, success, failure }

class CategoryState extends Equatable {
  final CategoryStatus status;
  final List<CategoryModel> categories;
  final String errorMessage;
  const CategoryState({
    this.status = CategoryStatus.initial,
    this.categories = const [],
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [status, categories, errorMessage];

  CategoryState copyWith({
    CategoryStatus? status,
    List<CategoryModel>? categories,
    String? errorMessage,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
