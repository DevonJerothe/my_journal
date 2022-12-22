import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../DB/database.dart';
import '../Models/models.dart';

final moodsState = StateProvider<List<MoodModel>?>((ref) => null);

final moodRepository =
    Provider.autoDispose<MoodRepo>((ref) => MoodRepoImp(ref.read));

abstract class MoodRepo {
  Future<void> getMoods();
  Future<void> addMood(MoodModel newMood);
}

class MoodRepoImp implements MoodRepo {
  final Reader _read;
  MoodRepoImp(this._read) {
    _db = AppDB.getInstance();

    // TODO: remove this placeholder
    var _ = _read(moodsState);
    initState();
  }

  late AppDB _db;

  void initState() {
    getMoods();
  }

  void dispose() {
    _db.close();
  }

  @override
  Future<void> addMood(MoodModel newMood) {
    // TODO: implement addMood
    throw UnimplementedError();
  }

  @override
  Future<void> getMoods() {
    // TODO: implement getMoods
    throw UnimplementedError();
  }
}
