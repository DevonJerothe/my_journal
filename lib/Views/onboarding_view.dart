import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_journal/Controllers/user_controller.dart';

class OnboardView extends HookConsumerWidget {
  const OnboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Welcome To MyJournal, \nLets Get Started!',
                maxLines: 2,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            /// TODO: Place cool welcome img here

            const Spacer(),
            const Text('lets start with a new account'),
            ElevatedButton.icon(
              onPressed: () {
                context.goNamed('CreateUserView');
                //ref.read(shouldShowUserRegestraition.notifier).state = true;
              },
              icon: const Icon(Icons.person_add_alt_1_rounded,
                  color: Colors.white),
              label: const Text('Create A New Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateUserView extends HookConsumerWidget {
  const CreateUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(userController);

    return Container();
  }
}
