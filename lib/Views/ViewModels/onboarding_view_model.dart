import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Models/models.dart';
import '../onboarding_view.dart';

final newUserStepIndexState = StateProvider<int>((ref) => 0);

final onboardingViewModel = Provider.autoDispose((ref) {
  final viewModel = OnboardingViewModel(ref.read);
  ref.onDispose(() => viewModel.dispose());
  return viewModel;
});

class OnboardingViewModel {
  final Reader _read;
  OnboardingViewModel(this._read);

  /// Any additional Onboarding screens should be added to this array
  final List<Widget> steps = [
    const CreateNewUserNameView(),
  ];

  var newUser = UserModel(
    userId: 123,
    name: 'noName',
    onBoardingFinished: false,
    dateCreated: DateTime.now(),
  );

  void initState() {}

  void dispose() {}

  void nextStep(BuildContext context) {
    final currStep = _read(newUserStepIndexState.notifier);
    if (currStep.state >= steps.length - 1) {
      context.goNamed('tabBarView');
    }else{
      currStep.state++;
    }
  }

  void previousStep() {
    _read(newUserStepIndexState.notifier).state--;
  }
}
