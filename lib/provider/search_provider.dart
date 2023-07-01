import 'package:flutter/widgets.dart';
import 'package:restauran_app/data/api/api_service.dart';
import 'package:restauran_app/data/model/search_resto.dart';

enum ResultState { loading, noData, hasData, error }

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchProvider({required this.apiService}) {
    fetcView(query);
  }
  ResultState? _state;
  LocalSearch? _search;
  String _query = '';
  String _message = '';

  ResultState? get state => _state;
  LocalSearch? get result => _search;
  String get query => _query;
  String get message => _message;

  Future<dynamic> fetcView(String query) async {
    try {
      if (query.isNotEmpty) {
        _state = ResultState.loading;
        _query = query;
        notifyListeners();
        final resResult = await apiService.restoSearch(query);
        if (resResult.restaurants.isNotEmpty) {
          _state = ResultState.hasData;
          notifyListeners();
          return _search = resResult;
        } else {
          _state = ResultState.noData;
          notifyListeners();
          return _message = '404 Not Found';
        }
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Network Connection';
    }
  }
}
