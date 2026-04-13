// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'activity_cubit.dart';

enum ActivityStatus { initial, loading, success, failure }

class ActivityState extends Equatable {
  final ActivityStatus status;
  final List<ActivityModel> allActivities;
  final List<ActivityModel> filteredActivities;
  final String errorMessage;
  const ActivityState({
    this.status = ActivityStatus.initial,
    this.errorMessage = '',
    this.allActivities = const [],
    this.filteredActivities = const [],
  });

  @override
  List<Object> get props => [
    status,
    allActivities,
    filteredActivities,
    errorMessage,
  ];

  ActivityState copyWith({
    ActivityStatus? status,
    List<ActivityModel>? allActivities,
    List<ActivityModel>? filteredActivities,
    String? errorMessage,
  }) {
    return ActivityState(
      status: status ?? this.status,
      allActivities: allActivities ?? this.allActivities,
      filteredActivities: filteredActivities ?? this.filteredActivities,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
