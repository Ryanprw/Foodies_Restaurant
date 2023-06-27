import 'package:flutter/material.dart';
import 'package:restauran_app/data/api/api_service.dart';
import 'package:restauran_app/data/model/detail_resto.dart';

enum ResultState { loading, noData, hasData, error }

class DetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailProvider({required this.apiService, required this.id}) {
    _fetchDetail(id);
  }

  late ResultState _state;
  late LocalDetail _detail;
  String _message = '';

  ResultState get state => _state;
  LocalDetail get result => _detail;
  String get message => _message;

  Future<dynamic> _fetchDetail(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restoDetail = await apiService.restoDetail(id);
      if (restoDetail.restaurant.id.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();
        return _detail = restoDetail;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Network Connection';
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No connection';
    }
  }
}
