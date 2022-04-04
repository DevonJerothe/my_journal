import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_journal/Views/ViewModels/onboarding_view_model.dart';

void main() {
  late ProviderContainer container;
  late OnboardingViewModel? sut;

  setUp(() {
    container = ProviderContainer();
    sut = container.read(onboardingViewModel);
  });

  tearDown(() {
    container.dispose();
    sut = null;
  });

  test(
    'Test Step back',
    () {
      expect(container.read(newUserStepIndexState), 0);

      container.read(newUserStepIndexState.notifier).state++;
      expect(container.read(newUserStepIndexState), 1);

      sut?.previousStep();
      expect(container.read(newUserStepIndexState), 0);
    },
  );
}
