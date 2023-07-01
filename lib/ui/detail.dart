import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:restauran_app/data/api/api_service.dart';
import 'package:restauran_app/widgets/detail_screen.dart';
import '../provider/resto_detail_provider.dart';
import '../until/result_state.dart';

class DetailList extends StatelessWidget {
  static const routeName = '/detail';
  final String id;

  const DetailList({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailProvider(apiService: ApiService(), id: id),
      child: Consumer<DetailProvider>(
        builder: (context, state, _) {
          switch (state.state) {
            case ResultState.loading:
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 0, 0, 0),
                  backgroundColor: Color.fromARGB(255, 9, 155, 84),
                ),
              );
            case ResultState.hasData:
              return ScreenDetail(resDetailRespon: state.result);
            case ResultState.error:
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.asset("assets/NoInternet.json"),
                  ],
                ),
              );
            default:
              return const Center(
                child: Text(
                  'No connection',
                  style: TextStyle(fontSize: 24),
                ),
              );
          }
        },
      ),
    );
  }
}
