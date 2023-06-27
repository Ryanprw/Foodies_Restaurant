import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:restauran_app/data/api/api_service.dart';
import 'package:restauran_app/provider/restaurant_provider.dart';
import 'package:restauran_app/ui/search_resto.dart';
import 'package:restauran_app/widgets/card_restaurant.dart';

class ListRestoScreen extends StatelessWidget {
  static const routeName = '/resto-list';

  const ListRestoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 145, 80),
      appBar: AppBar(
        title: const Text("Foodies"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 145, 80),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPageScreen.routeName);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: _RestoListb(context),
    );
  }
}

Widget _RestoListb(BuildContext context) {
  return ChangeNotifierProvider(
    create: (_) => RestoListProvider(apiService: ApiService()),
    child: Consumer<RestoListProvider>(
      builder: (context, state, _) {
        switch (state.state) {
          case ResultState.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                backgroundColor: Colors.green,
              ),
            );
          case ResultState.hasData:
            return ListView.builder(
              itemBuilder: (context, index) {
                var resto = state.result.restaurants[index];

                return ListResto(
                  resto: resto,
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
                  LottieBuilder.asset("assets/connection.json"),
                ],
              ),
            );
          default:
            return const Center(
              child: Text(
                'Gagal Load Data',
                style: TextStyle(fontSize: 25),
              ),
            );
        }
      },
    ),
  );
}
