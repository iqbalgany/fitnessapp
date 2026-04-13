import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitnessapp/data/datasources/category_datasource.dart';
import 'package:fitnessapp/data/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryDatasource _datasource;
  CategoryCubit(this._datasource) : super(const CategoryState()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    emit(state.copyWith(status: CategoryStatus.loading));

    try {
      final categories = await _datasource.getCategories();

      emit(
        state.copyWith(status: CategoryStatus.success, categories: categories),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CategoryStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
