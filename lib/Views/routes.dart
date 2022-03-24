import 'package:go_router/go_router.dart';
import 'package:my_journal/Views/onboarding_view.dart';
import 'package:my_journal/main.dart';

class AppRouter {
  static final getRoutes = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: 'LaunchView',
      builder: (context, state) => const AppLaunchView(),
    ),
    GoRoute(
      path: '/onboard',
      name: 'OnboardingView',
      builder: (context, state) => const OnboardView(),
    ),
    GoRoute(
      path: '/create/user',
      name: 'CreateUserView',
      builder: (context, state) => const CreateUserView(),
    ),
    GoRoute(
      path: '/tabbarView',
      name: 'tabBarView',
      builder: (context, state) => const TabBarView()
    ),
  ]);
}
