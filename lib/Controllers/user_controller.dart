import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_journal/DB/database.dart';
import 'package:my_journal/Repository/user_repo.dart';
import '../Models/models.dart';

final userState = StateProvider<UserModel?>((ref) => null);
final userErrorState = StateProvider<String?>((ref) => null);

final userController = Provider.autoDispose((ref) => UserController(ref.read));

class UserController {
  final Reader _read;
  UserController(this._read) {
    initState();
  }

  void initState() {
    debugPrint("INIT: USERCONTROLLER");
    getCurrentUser();
  }

  void dispose() {
    _read(userState) == null;
  }

  Future<void> getCurrentUser() async {
    _read(userState.notifier).state =
        await _read(userRepository).getCurrentUser();
  }

  Future<void> createNewUser(UsersCompanion newUser) async {
    _read(userState.notifier).state =
        await _read(userRepository).createNewUser(newUser);
  }

  Future<void> updateUser(UsersCompanion user) async {
    final didUpdate = await _read(userRepository).updateUser(user);
    if (!didUpdate) {
      _read(userErrorState.notifier).state = "User Failed To Update";
    }
  }
}

extension MockUserDate on UserController {
  Future<void> createNewUserWithMock() async {
    final mockUser = UsersCompanion(
        name: const Value("DevonMock"), dateCreated: Value(DateTime.now()));

    _read(userState.notifier).state =
        await _read(userRepository).createNewUser(mockUser);
  }
}
