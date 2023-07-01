import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:restauran_app/data/api/api_service.dart';
import 'package:restauran_app/ui/search.dart';
import 'package:restauran_app/widgets/card_screen.dart';
import '../provider/list_detail_provider.dart';
import '../until/result_state.dart';

class ListScreen extends StatelessWidget {
  static const routeName = '/list';

  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foodies"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: _listBody(context),
    );
  }
}

Widget _listBody(BuildContext context) {
  return ChangeNotifierProvider(
    create: (_) => ListProvider(apiService: ApiService()),
    child: Consumer<ListProvider>(
      builder: (context, state, _) {
        switch (state.state) {
          case ResultState.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 0, 0, 0),
                backgroundColor: Color.fromARGB(255, 21, 231, 28),
              ),
            );
          case ResultState.hasData:
            return ListView.builder(
              itemBuilder: (_, index) {
                var resto = state.result.restaurants[index];
                return CardScreen(
                  restaurant: resto,
                );
              },
              itemCount: state.result.restaurants.length,
            );
          case ResultState.noData:
            return Center(
              child: Text(state.message),
            );
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
                'Failed to load data',
                style: TextStyle(fontSize: 25),
              ),
            );
        }
      },
    ),
  );
}
