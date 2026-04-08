import 'package:fitnessapp/presentations/main_page.dart';
import 'package:fitnessapp/presentations/pages/home_page.dart';
import 'package:fitnessapp/presentations/pages/onboarding_page.dart';
import 'package:fitnessapp/presentations/pages/profile_page.dart';
import 'package:fitnessapp/presentations/pages/run_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final onboardingName = 'onboarding';
  static final mainName = 'main';
  static final homeName = 'home';
  static final runName = 'run';
  static final profileName = 'profile';

  static final onboardingPath = '/onboarding';
  static final mainPath = '/main';
  static final homePath = '/home';
  static final runPath = '/run';
  static final profilePath = '/profile';

  static final router = GoRouter(
    initialLocation: onboardingPath,

    routes: [
      GoRoute(
        path: onboardingPath,
        name: onboardingName,
        builder: (context, state) => OnboardingPage(),
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
        path: runPath,
        name: runName,
        builder: (context, state) => RunPage(),
      ),
      GoRoute(
        path: profilePath,
        name: profileName,
        builder: (context, state) => ProfilePage(),
      ),
    ],
  );
}
