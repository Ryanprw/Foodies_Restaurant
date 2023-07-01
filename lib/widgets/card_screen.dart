import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restauran_app/ui/detail.dart';
import '../data/model/restaurant.dart';
import '../provider/db_provider.dart';

class CardScreen extends StatelessWidget {
  final Restaurant restaurant;

  const CardScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
        future: provider.isFavorit(restaurant.id),
        builder: (context, snapshot) {
          var isFav = snapshot.data ?? false;
          return Material(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailList.routeName,
                    arguments: restaurant.id);
              },
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Stack(
                        children: [
                          Card(
                            color: Colors.black,
                            elevation: 8,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child: Image.network(
                                    "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: isFav
                                            ? IconButton(
                                                onPressed: () =>
                                                    provider.removeFavorite(
                                                        restaurant.id),
                                                icon: const Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ),
                                              )
                                            : IconButton(
                                                onPressed: () => provider
                                                    .addFavorite(restaurant),
                                                icon: const Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.white,
                                                ),
                                              ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //membuat column untuk sebuah text
                          Positioned(
                            bottom: 15,
                            left: 15,
                            child: SizedBox(
                              height: 70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.name,
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        restaurant.city,
                                        style: GoogleFonts.montserrat(
                                          textStyle:
                                              const TextStyle(fontSize: 15),
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        restaurant.rating.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
