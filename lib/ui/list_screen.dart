import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:restauran_app/data/api/api_service.dart';
import 'package:restauran_app/provider/restaurant_provider.dart';
import 'package:restauran_app/ui/search.dart';
import 'package:restauran_app/widgets/card_screen.dart';

class ListScreen extends StatelessWidget {
  static const routeName = '/list';

  const ListScreen({Key? key}) : super(key: key);

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
              itemBuilder: (context, index) {
                var resto = state.result.restaurants[index];

                return CardScreen(
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
                  LottieBuilder.asset("assets/ghost.json"),
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
