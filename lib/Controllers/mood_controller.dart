import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Models/models.dart';
import '../Repository/mood_repo.dart';

final _moodsState = StateProvider<List<MoodModel>?>((ref) => null);

final moodController = Provider.autoDispose((ref) => MoodController(ref.read));

class MoodController {
  final Reader _read;
  MoodController(this._read);

  Future<void> initState() async {
    _read(_moodsState.notifier).state = await _read(moodRepository).getMoods();
  }

  void dispose() {
    _read(_moodsState)?.clear();
  }
  
  Future<void> addMood(MoodModel newMood) async {}

  Future<void> getMoods(DateTime? date) async {
    date ??= DateTime.now();
  }
}
