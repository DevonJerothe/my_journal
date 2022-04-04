part of 'models.dart';

class UserModel implements Insertable<UserModel> {
  int userId;
  String name;
  bool onBoardingFinished;
  DateTime dateCreated;
  UserModel({
    required this.userId,
    required this.name,
    required this.onBoardingFinished,
    required this.dateCreated,
  });

  UserModel copyWith({
    int? userId,
    String? name,
    bool? onBoardingFinished,
    DateTime? dateCreated,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      onBoardingFinished: onBoardingFinished ?? this.onBoardingFinished,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'onBoardingFinished': onBoardingFinished,
      'dateCreated': dateCreated.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId']?.toInt() ?? 0,
      name: map['name'] ?? '',
      onBoardingFinished: map['onBoardingFinished'] ?? false,
      dateCreated: DateTime.fromMillisecondsSinceEpoch(map['dateCreated']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  factory UserModel.createModelMock() => UserModel(
        userId: 123,
        name: 'MrMock',
        onBoardingFinished: true,
        dateCreated: DateTime.now(),
      );

  @override
  String toString() {
    return 'UserModel(userId: $userId, name: $name, onBoardingFinished: $onBoardingFinished, dateCreated: $dateCreated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.userId == userId &&
        other.name == name &&
        other.onBoardingFinished == onBoardingFinished &&
        other.dateCreated == dateCreated;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        name.hashCode ^
        onBoardingFinished.hashCode ^
        dateCreated.hashCode;
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return UsersCompanion(
            userId: Value(userId),
            name: Value(name),
            onBoardingFinished: Value(onBoardingFinished),
            dateCreated: Value(dateCreated))
        .toColumns(nullToAbsent);
  }
}
