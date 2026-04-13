import 'package:fitnessapp/presentations/cubits/activity/activity_cubit.dart';
import 'package:fitnessapp/presentations/cubits/auth/auth_cubit.dart';
import 'package:fitnessapp/presentations/cubits/category/category_cubit.dart';
import 'package:fitnessapp/presentations/widgets/activities_card.dart';
import 'package:fitnessapp/presentations/widgets/categories_card.dart';
import 'package:fitnessapp/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, authState) {
                            return Text(
                              'Hi, ${authState.user?.fullName ?? 'Empty'}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        ),
                        Text(
                          'Let\'s check your activity',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),

                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '💪 Finished',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '12',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                        Text(
                          'Completed\nWorkouts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),

                Column(
                  children: [
                    Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '🔄️ In progress',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  '2',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Workouts',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '⏱️ Time spent',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  '62',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text('Minutes', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Discover new workouts',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 20),

            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, categoryState) {
                return SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: categoryState.categories.length,
                    separatorBuilder: (context, index) => SizedBox(width: 20),
                    itemBuilder: (context, index) {
                      final category = categoryState.categories[index];
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            AppRoutes.activitiesName,
                            pathParameters: {'category': category.title},
                          );
                        },
                        child: CategoriesCard(
                          title: category.title,
                          exercises: category.exercises,
                          minutes: category.minutes,
                          imageUrl: category.imageUrl,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Top workouts',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            BlocBuilder<ActivityCubit, ActivityState>(
              builder: (context, activityState) {
                return ListView.separated(
                  itemCount: activityState.allActivities.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final activity = activityState.allActivities[index];
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

            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
