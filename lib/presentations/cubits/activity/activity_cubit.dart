import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitnessapp/data/datasources/activity_datasource.dart';
import 'package:fitnessapp/data/models/activity_model.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  final ActivityDatasource _datasource;
  ActivityCubit(this._datasource) : super(const ActivityState()) {
    fetchAllActivities();
  }

  Future<void> fetchActivitiesByCategory(String categoryName) async {
    emit(state.copyWith(status: ActivityStatus.loading));

    try {
      final activities = await _datasource.getActivitiesByCategory(
        categoryName,
      );

      emit(
        state.copyWith(
          status: ActivityStatus.success,
          filteredActivities: activities,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ActivityStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> fetchAllActivities() async {
    emit(state.copyWith(status: ActivityStatus.loading));

    try {
      final activities = await _datasource.getAllActivities();

      emit(
        state.copyWith(
          status: ActivityStatus.success,
          allActivities: activities,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ActivityStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
