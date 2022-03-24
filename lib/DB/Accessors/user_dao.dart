part of 'daos.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDB> with _$UserDaoMixin {
  UserDao(AppDB db) : super(db);

  Future<UserModel?> checkForUser() async =>
      (select(users)..limit(1)).getSingleOrNull();

  Future<UserModel> createUser(UsersCompanion newUser) async {
    int id = await into(users).insert(newUser);
    return (select(users)..where((tbl) => tbl.userId.equals(id))).getSingle();
  }

  Future<bool> updateUser(UsersCompanion user) async {
    try {
      (update(users)..replace(user));
      return true;
    } catch (e) {
      //TODO: add error message
      return false;
    }
  }
}
