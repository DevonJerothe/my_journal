import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../DB/database.dart';
import '../Models/models.dart';

//USERSTATES:
final loggedIn = StateProvider<bool>((ref) {
  var loggedUser = ref.watch(userState);
  if (loggedUser != null) {
    return true;
  }
  return false;
});
final userState = StateProvider<UserModel?>((ref) => null);
final userErrorState = StateProvider<String?>((ref) => null);

final userRepository =
    Provider.autoDispose<UserRepo>((ref) => UserRepoImp(ref.read));

abstract class UserRepo {
  Future<void> getCurrentUser();
  Future<void> createNewUser(UsersCompanion newUser);
  Future<void> updateUser(UsersCompanion user);
}

class UserRepoImp implements UserRepo {
  final Reader _read;
  UserRepoImp(this._read) {
    _db = AppDB.getInstance();
    initState();
  }

  late AppDB _db;

  void initState() {
   getCurrentUser();
    //checkLoggedIn();
  }

  void dispose() {
    //TODO: dispose
  }

  Future<void> checkLoggedIn() async {
    final loggedUser = _read(userState);
    if (loggedUser != null) {
      _read(loggedIn.notifier).state = true;
    }
  }

  @override
  Future<void> getCurrentUser() async {
    final dbUser = await _db.userDao.checkForUser();
    if (dbUser != null) {
      _read(userState.notifier).state = UserModel.fromJson(dbUser.toJson());
    }
  }

  @override
  Future<void> createNewUser(UsersCompanion newUser) async {
    final dbUser = await _db.userDao.createUser(newUser);
    _read(userState.notifier).state = UserModel.fromJson(dbUser.toJson());
  }

  @override
  Future<void> updateUser(UsersCompanion user) async {
    final update = await _db.userDao.updateUser(user);
    //TODO: Handle errors better
    if (!update) {
      _read(userErrorState.notifier).state = "User Failed To Update";
    }
  }
}

extension MockUserData on UserRepoImp {
  Future<void> createNewUserWithMock() async {
    final mockUser = UsersCompanion(
        name: const Value("DevonMock"), dateCreated: Value(DateTime.now()));

    createNewUser(mockUser);
  }
}
