import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_journal/Views/onboarding_view.dart';
import 'package:my_journal/routes.dart';

import 'Controllers/user_controller.dart';

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
    final user = ref.watch(userState);

    if (user != null) {
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
