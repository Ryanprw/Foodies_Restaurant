import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restauran_app/widgets/search_screen.dart';
import 'package:restauran_app/provider/search_provider.dart';
import 'package:restauran_app/data/api/api_service.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String queries = '';

  Widget _buildSearchResto(BuildContext context) {
    return Consumer<SearchResProvider>(
      builder: (context, state, _) {
        switch (state.state) {
          case ResultState.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                backgroundColor: Colors.greenAccent,
              ),
            );
          case ResultState.hasData:
            return ListView.builder(
              itemBuilder: (context, index) {
                var restaurant = state.result!.restaurants[index];
                return ScreenSearch(
                  restaurant: restaurant,
                );
              },
              itemCount: state.result?.restaurants.length,
            );
          case ResultState.noData:
            return Center(
              child: Text(state.message),
            );
          case ResultState.error:
            return Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 300,
                height: double.infinity,
                child: LottieBuilder.asset("assets/ghost.json"),
              ),
            );
          default:
            return Center(
              child: LottieBuilder.asset("assets/product.json"),
            );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchResProvider(
        apiService: ApiService(),
      ),
      child: Consumer<SearchResProvider>(
        builder: (context, state, _) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 12, 145, 80),
            body: Stack(
              children: [
                SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Search...",
                        hintStyle: const TextStyle(fontWeight: FontWeight.w300),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      onChanged: (String result) {
                        setState(
                          () {
                            queries = result;
                          },
                        );
                        state.fetcViewRes(result);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: _buildSearchResto(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
