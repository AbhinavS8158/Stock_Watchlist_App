
import 'package:hive/hive.dart';

part 'watchlist_model.g.dart';
@HiveType(typeId: 1)
class WatchlistModel {

@HiveField(0 )
final String name;

@HiveField(1)
final String score;

  WatchlistModel({required this.name, required this.score});
}