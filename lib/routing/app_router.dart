import 'package:fitnessapp/data/datasources/auth_remote_datasource.dart';
import 'package:fitnessapp/presentations/cubits/auth/auth_cubit.dart';
import 'package:fitnessapp/presentations/main_page.dart';
import 'package:fitnessapp/presentations/pages/activities_page.dart';
import 'package:fitnessapp/presentations/pages/auth_page.dart';
import 'package:fitnessapp/presentations/pages/home_page.dart';
import 'package:fitnessapp/presentations/pages/onboarding_page.dart';
import 'package:fitnessapp/presentations/pages/profile_page.dart';
import 'package:fitnessapp/routing/go_router_refresh_stream.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final authCubit = AuthCubit(AuthRemoteDatasource());

  static final onboardingName = 'onboarding';
  static final authName = 'auth';
  static final mainName = 'main';
  static final homeName = 'home';
  static final runName = 'run';
  static final profileName = 'profile';
  static final activitiesName = 'activities';

  static final onboardingPath = '/onboarding';
  static final authPath = '/auth';
  static final mainPath = '/main';
  static final homePath = '/home';
  static final runPath = '/run';
  static final profilePath = '/profile';
  static final activitiesPath = '/activities/:category';

  static final router = GoRouter(
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    initialLocation: onboardingPath,

    redirect: (context, state) {
      final authState = authCubit.state;

      final bool isLoggedIn = authState.status == AuthStatus.authenticated;

      final String location = state.matchedLocation;

      final bool isLoggingIn = location == authPath;
      final bool isOnboarding = location == onboardingPath;

      if (!isLoggedIn) {
        if (isOnboarding) return null;

        if (!isLoggingIn) return authPath;
      }

      if (isLoggedIn) {
        if (isLoggingIn || isOnboarding) return mainPath;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: onboardingPath,
        name: onboardingName,
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(
        path: authPath,
        name: authName,
        builder: (context, state) => AuthPage(),
      ),
      GoRoute(
        path: mainPath,
        name: mainName,
        builder: (context, state) => MainPage(),
      ),
      GoRoute(
        path: homePath,
        name: homeName,
        builder: (context, state) => HomePage(),
      ),

      GoRoute(
        path: profilePath,
        name: profileName,
        builder: (context, state) => ProfilePage(),
      ),
      GoRoute(
        path: activitiesPath,
        name: activitiesName,
        builder: (context, state) {
          final categoryName = state.pathParameters['category'];
          return ActivitiesPage(categoryName: categoryName!);
        },
      ),
    ],
  );
}
