part of 'models.dart';

class MoodModel {
  String name;
  String description;
  int moodScale;
  int color;
  DateTime dateCreated = DateTime.now();

  MoodModel({
    required this.name,
    required this.description,
    required this.moodScale,
    required this.color,
  });

  MoodModel copyWith({
    String? name,
    String? description,
    int? moodScale,
    int? color,
  }) {
    return MoodModel(
      name: name ?? this.name,
      description: description ?? this.description,
      moodScale: moodScale ?? this.moodScale,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'moodScale': moodScale,
      'color': color,
    };
  }

  factory MoodModel.fromMap(Map<String, dynamic> map) {
    return MoodModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      moodScale: map['moodScale']?.toInt() ?? 0,
      color: map['color']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoodModel.fromJson(String source) =>
      MoodModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MoodModel(name: $name, description: $description, moodScale: $moodScale, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoodModel &&
        other.name == name &&
        other.description == description &&
        other.moodScale == moodScale &&
        other.color == color;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        moodScale.hashCode ^
        color.hashCode;
  }
}
