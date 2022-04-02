import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_journal/Repository/user_repo.dart';

void main() {
  late ProviderContainer container;
  late UserRepoImp sut;

  setUp(() {
    container = ProviderContainer(overrides: [
      userRepository.overrideWithProvider(
          Provider.autoDispose((ref) => UserRepoImp(ref.read, mockDB: true)))
    ]);
    sut = container.read(userRepository);
    sut.initState();
  });

  tearDown(() async {
    container.dispose();
    sut.dispose();
  });

  test(
    'description',
    () {
      // sut.
    },
  );
}
