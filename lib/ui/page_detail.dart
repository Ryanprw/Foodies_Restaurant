import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restauran_app/provider/detail_provider.dart';
import 'package:restauran_app/widgets/detail_page.dart';
import '../data/api/api_service.dart';

class DetailPageList extends StatelessWidget {
  static const routeName = '/resto-detail';
  final String id;

  const DetailPageList({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ResDetailProvider(apiService: ApiService(), id: id),
      child: Consumer<ResDetailProvider>(
        builder: (context, state, _) {
          switch (state.state) {
            case ResultState.loading:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                  backgroundColor: Colors.grey,
                ),
              );
            case ResultState.hasData:
              return PageDetail(restaurant: state.result.restaurant);
            case ResultState.error:
              return Center(
                child: Text(state.message),
              );
            default:
              return const Center(
                child: Text(
                  'Tidak ada koneksi',
                  style: TextStyle(fontSize: 24),
                ),
              );
          }
        },
      ),
    );
  }
}
