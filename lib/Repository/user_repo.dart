import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../DB/database.dart';
import '../Models/models.dart';

final userRepository =
    Provider.autoDispose<UserRepo>((ref) => UserRepoImp());

abstract class UserRepo {
  Future<UserModel?> getCurrentUser();
  Future<UserModel> createNewUser(UsersCompanion newUser);
  Future<bool> updateUser(UsersCompanion user);
}

class UserRepoImp implements UserRepo {
  //final Reader _read;
  UserRepoImp() {
    _db = AppDB.getInstance();
  }

  late AppDB _db;

  @override
  Future<UserModel?> getCurrentUser() async {
    final dbUser = await _db.userDao.checkForUser();
    if (dbUser != null) {
      return UserModel.fromJson(dbUser.toJson());
    }
    return null;
  }

  @override
  Future<UserModel> createNewUser(UsersCompanion newUser) async {
    final dbUser = await _db.userDao.createUser(newUser);
    return UserModel.fromJson(dbUser.toJson());
  }

  @override
  Future<bool> updateUser(UsersCompanion user) async {
    final update = await _db.userDao.updateUser(user);
    return update;
  }
}
