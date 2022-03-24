// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UsersCompanion extends UpdateCompanion<UserModel> {
  final Value<int> userId;
  final Value<String> name;
  final Value<bool> onBoardingFinished;
  final Value<DateTime> dateCreated;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.onBoardingFinished = const Value.absent(),
    this.dateCreated = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userId = const Value.absent(),
    required String name,
    this.onBoardingFinished = const Value.absent(),
    required DateTime dateCreated,
  })  : name = Value(name),
        dateCreated = Value(dateCreated);
  static Insertable<UserModel> custom({
    Expression<int>? userId,
    Expression<String>? name,
    Expression<bool>? onBoardingFinished,
    Expression<DateTime>? dateCreated,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (onBoardingFinished != null)
        'on_boarding_finished': onBoardingFinished,
      if (dateCreated != null) 'date_created': dateCreated,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? userId,
      Value<String>? name,
      Value<bool>? onBoardingFinished,
      Value<DateTime>? dateCreated}) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      onBoardingFinished: onBoardingFinished ?? this.onBoardingFinished,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (onBoardingFinished.present) {
      map['on_boarding_finished'] = Variable<bool>(onBoardingFinished.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('onBoardingFinished: $onBoardingFinished, ')
          ..write('dateCreated: $dateCreated')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, UserModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _onBoardingFinishedMeta =
      const VerificationMeta('onBoardingFinished');
  @override
  late final GeneratedColumn<bool?> onBoardingFinished = GeneratedColumn<bool?>(
      'on_boarding_finished', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (on_boarding_finished IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime?> dateCreated =
      GeneratedColumn<DateTime?>('date_created', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, name, onBoardingFinished, dateCreated];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('on_boarding_finished')) {
      context.handle(
          _onBoardingFinishedMeta,
          onBoardingFinished.isAcceptableOrUnknown(
              data['on_boarding_finished']!, _onBoardingFinishedMeta));
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    } else if (isInserting) {
      context.missing(_dateCreatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserModel(
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      onBoardingFinished: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}on_boarding_finished'])!,
      dateCreated: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_created'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  late final UserDao userDao = UserDao(this as AppDB);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}
