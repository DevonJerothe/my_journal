import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ViewModels/onboarding_view_model.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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

class CreateUserView extends ConsumerWidget {
  const CreateUserView({Key? key}) : super(key: key);

  Widget buildTransitions(int index, List<Widget> steps) =>
      PageTransitionSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.vertical,
          fillColor: Colors.green,
          child: child,
        ),
        child: steps[index],
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(onboardingViewModel);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.green,
              Color.fromARGB(255, 193, 219, 193),
            ],
          ),
        ),
        child: buildTransitions(
          ref.watch(newUserStepIndexState),
          viewModel.steps,
        ),
      ),
    );
  }
}

class CreateNewUserNameView extends HookConsumerWidget {
  const CreateNewUserNameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(onboardingViewModel);
    final textEditingController = useTextEditingController();

    //backgroundColor: Colors.green,
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.green,
            Color.fromARGB(255, 133, 226, 133),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'What should I call you?',
                maxLines: 2,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: textEditingController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(3),
                  hintText: '',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                onSubmitted: (val) {
                  viewModel.newUser = viewModel.newUser.copyWith(name: val);
                  viewModel.nextStep(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
