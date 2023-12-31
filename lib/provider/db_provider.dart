import 'package:flutter/material.dart';
import 'package:restauran_app/data/model/restaurant.dart';
import '../db/db_helper.dart';
import '../until/result_state.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    _getFavorite();
  }

  late ResultState _state;

  String _message = "";

  List<Restaurant> _listFav = [];

  ResultState get state => _state;

  String get message => _message;

  List<Restaurant> get favorite => _listFav;

  void _getFavorite() async {
    _listFav = await databaseHelper.getFavorite();
    if (_listFav.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = "";
    }
    notifyListeners();
  }

  void addFavorite(Restaurant restaurant) async {
    try {
      await databaseHelper.insertFavorite(restaurant);
      _getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error : $e';
      notifyListeners();
    }
  }

  void removeFavorite(String id) async {
    try {
      await databaseHelper.removeFavorite(id);
      _getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error : $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorit(String id) async {
    final favRestauran = await databaseHelper.getFavoriteById(id);
    return favRestauran.isNotEmpty;
  }
}
