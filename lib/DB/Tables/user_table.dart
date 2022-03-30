import 'package:drift/drift.dart';
import '../../Models/models.dart';

@UseRowClass(UserModel)
class Users extends Table {
  IntColumn get userId => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get onBoardingFinished =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get dateCreated => dateTime()();
}
