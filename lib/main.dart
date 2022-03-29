import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_journal/Views/onboarding_view.dart';
import 'package:my_journal/routes.dart';

import 'Repository/user_repo.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouter.getRoutes.routeInformationParser,
      routerDelegate: AppRouter.getRoutes.routerDelegate,
      title: 'Journal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class AppLaunchView extends HookConsumerWidget {
  const AppLaunchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final _ = UserRepoImp(ref.read);
      return null;
    });

    final userLoggedIn = ref.read(loggedIn);

    if (userLoggedIn) {
      return const MainTabBarView();
    } else {
      return const OnboardView();
    }
  }
}

class MainTabBarView extends HookConsumerWidget {
  const MainTabBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
