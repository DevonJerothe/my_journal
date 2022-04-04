import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:my_journal/DB/database.dart';
import 'package:my_journal/Mocks/db_mocks.dart';
import 'package:my_journal/Models/models.dart';
import 'package:my_journal/Repository/user_repo.dart';

///TODO: Mock the DB with Mockito
void main() {
  late ProviderContainer container;
  late UserRepoImp sut;
  final db = AppDBMock();

  setUp(() async {
    /// Setup DB dependencies.
    container = ProviderContainer(overrides: [
      userRepository.overrideWithProvider(
          Provider((ref) => UserRepoImp(ref.read, mockDB: db)))
    ]);
    sut = container.read(userRepository);
  });

  // tearDown(() async {
  //   container.dispose();
  //   sut.dispose();
  // });

  group(
    'Repo Test',
    () {
      test(
        'Test checkLoggedIn',
        () async {
          container.read(userState.notifier).state = null;
          expect(container.read(loggedIn), false);

          var userMock = UserModel.createModelMock();
          container.read(userState.notifier).state = userMock;

          await sut.checkLoggedIn();
          expect(container.read(loggedIn), true);
        },
      );

      test(
        'Test getCurrentUser',
        () async {
          container.read(userState.notifier).state = null;
          expect(container.read(userState), null);

          await sut.getCurrentUser();
          expect(container.read(userState) != null, true);
        },
      );

      test(
        'Test createNewUser',
        () async {
          container.read(userState.notifier).state = null;
          expect(container.read(userState), null);

          final currentDate = DateTime.now();
          final userCompanion = UsersCompanion(
            name: const Value('MrMock'),
            onBoardingFinished: const Value(true),
            dateCreated: Value(currentDate),
          );

          await sut.createNewUser(userCompanion);
          expect(container.read(userState) != null, true);
        },
      );
    },
  );
}
