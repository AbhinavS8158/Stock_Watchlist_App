import 'package:bmtask/model/watchlist_model.dart';
import 'package:hive/hive.dart';

class WatchlistService {
  static final Box<WatchlistModel> _box =
      Hive.box<WatchlistModel>('watchlist');


  static void addStock({
    required String name,
    required String score,
  }) {
    final stock = WatchlistModel(
      name: name,
      score: score,
    );

    _box.add(stock);
  }
  static List<WatchlistModel> getAllStocks() {
    return _box.values.toList();
  }
   static Future<void> deleteByIndex(int index) async {
    await _box.deleteAt(index);
  }

  /// Optional: check duplicate
  static bool isAlreadyAdded(String name) {
    return _box.values.any((item) => item.name == name);
  }
}