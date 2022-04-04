import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:my_journal/DB/Accessors/daos.dart';
import 'package:my_journal/Models/models.dart';

import '../DB/database.dart';

class AppDBMock extends Mock implements AppDB {
  @override
  final userDao = UserDaoMock();
}

class UserDaoMock extends Mock implements UserDao {
  @override
  Future<UserModel?> checkForUser() async {
    final dateCreated = DateTime.now();
    return UserModel(
        userId: 123,
        name: "MrMock",
        onBoardingFinished: true,
        dateCreated: dateCreated);
  }

  @override
  Future<UserModel> createUser(UsersCompanion newUser) async {
    final dateCreated = DateTime.now();
    return UserModel(
        userId: 123,
        name: "MrMock",
        onBoardingFinished: true,
        dateCreated: dateCreated);
  }

  @override
  Future<bool> updateUser(UsersCompanion user) async {
    return true;
  }
}
