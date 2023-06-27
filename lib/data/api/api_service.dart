import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restauran_app/data/model/detail_restaurant.dart';
import 'package:restauran_app/data/model/restaurant.dart';
import 'package:restauran_app/data/model/search_restaurant.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String list = 'list';
  static const String _detail = 'detail/';
  static const String _search = 'search?q=';

  Future<ResRestoran> getData() async {
    final response = await http.get(Uri.parse(_baseUrl + list));
    if (response.statusCode == 200) {
      return ResRestoran.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<ResDetail> restoDetail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + _detail + id));
    if (response.statusCode == 200) {
      return ResDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('No connection ');
    }
  }

  Future<ResSearch> restoSearch(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + _search + query));
    if (response.statusCode == 200) {
      return ResSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat pencarian restoran');
    }
  }
}
