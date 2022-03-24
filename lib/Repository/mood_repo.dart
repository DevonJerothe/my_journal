import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Models/models.dart';

final moodRepository =
    Provider.autoDispose<MoodRepo>((ref) => MoodRepoImp());

abstract class MoodRepo {
  Future<List<MoodModel>> getMoods();
  Future<void> addMood(MoodModel newMood);
}

class MoodRepoImp implements MoodRepo {
  MoodRepoImp();

  @override
  Future<void> addMood(MoodModel newMood) {
    // TODO: implement addMood
    throw UnimplementedError();
  }

  @override
  Future<List<MoodModel>> getMoods() {
    // TODO: implement getMoods
    throw UnimplementedError();
  }
}
