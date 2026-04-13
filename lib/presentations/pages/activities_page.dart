import 'package:fitnessapp/presentations/cubits/activity/activity_cubit.dart';
import 'package:fitnessapp/presentations/widgets/activities_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesPage extends StatelessWidget {
  final String categoryName;
  const ActivitiesPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    context.read<ActivityCubit>().fetchActivitiesByCategory(categoryName);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryName, style: TextStyle(color: Colors.black)),
      ),
      body: BlocBuilder<ActivityCubit, ActivityState>(
        builder: (context, activityState) {
          return ListView.separated(
            itemCount: activityState.filteredActivities.length,
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemBuilder: (context, index) {
              final activity = activityState.filteredActivities[index];
              return ActivitiesCard(
                title: activity.title,
                set: activity.sets.toString(),
                repetition: activity.repetition.toString(),
                minutes: activity.minutes.toString(),
                imageUrl: activity.imageUrl,
              );
            },
          );
        },
      ),
    );
  }
}
