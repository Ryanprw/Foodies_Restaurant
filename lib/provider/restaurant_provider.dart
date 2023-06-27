import 'package:flutter/material.dart';
import 'package:restauran_app/data/api/api_service.dart';
import 'package:restauran_app/data/model/restaurant.dart';

enum ResultState { loading, noData, hasData, error }

class ListProvider extends ChangeNotifier {
  final ApiService apiService;

  ListProvider({required this.apiService}) {
    _fetList();
  }

  late ResultState _state;
  late LocalRestaurant _list;
  String _massage = '';

  ResultState get state => _state;

  LocalRestaurant get result => _list;

  String get message => _massage;

  Future<dynamic> _fetList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final resto = await apiService.getData();
      if (resto.restaurants.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();
        return _list = resto;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _massage = "Data Tidak Ada";
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _massage = 'No Network Connection';
    }
  }
}
