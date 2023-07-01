import 'package:flutter/material.dart';
import 'package:restauran_app/data/api/api_service.dart';
import 'package:restauran_app/data/model/restaurant.dart';
import '../until/result_state.dart';

class ListProvider extends ChangeNotifier {
  late final ApiService apiService;

  ListProvider({required this.apiService}) {
    _fetRestoList();
  }

  late ResultState _state;
  late LocalListRestaurant _list;
  String _massage = '';

  ResultState get state => _state;

  LocalListRestaurant get result => _list;

  String get message => _massage;

  Future<dynamic> _fetRestoList() async {
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
      return _massage = 'Gagal Memuat Data';
    }
  }
}
