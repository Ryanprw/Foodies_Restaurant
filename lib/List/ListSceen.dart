import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restauran_app/List/detail_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> map = [];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 39, 39),
      body: FutureBuilder<String>(
        future: _Restaurant(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          try {
            if (snapshot.hasData) {
              map = List<Map<String, dynamic>>.from(
                json.decode(snapshot.data)['restaurants'],
              );
              final dataRestaurant = map;

              // return data berupa text
              return Center(
                child: ListView.builder(
                  itemCount: dataRestaurant.length,
                  itemBuilder: (context, index) {
                    final listDataRestaurant = dataRestaurant[index];
                    var listFoods =
                        listDataRestaurant['menus']['foods'].map((e) {
                      return e;
                    }).toList();
                    var listDrinks =
                        listDataRestaurant['menus']['drinks'].map((e) {
                      return e;
                    }).toList();

                    return InkWell(
                      onTap: () {
                        // berpindah halaman ke detail
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              restaurantID: listDataRestaurant["id"],
                              restaurantNAME: listDataRestaurant["name"],
                              restaurantDESCRIPTION:
                                  listDataRestaurant["description"],
                              restaurantPICTUREID:
                                  listDataRestaurant["pictureId"],
                              restaurantCITY: listDataRestaurant["city"],
                              restaurantRATING:
                                  listDataRestaurant["rating"].toString(),
                              restaurantDrink: listDrinks,
                              restaurantFood: listFoods,
                            ),
                          ),
                        );
                      },
                      // menampilkan content
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: Stack(
                            children: [
                              Card(
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
                                        listDataRestaurant["pictureId"],
                                        fit: BoxFit.cover,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listDataRestaurant["name"],
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            listDataRestaurant["city"],
                                            style: GoogleFonts.montserrat(
                                              textStyle:
                                                  TextStyle(fontSize: 15),
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
                                            listDataRestaurant["rating"]
                                                .toString(),
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
                      ),
                    );
                  },
                ),
              );
            }
          } catch (e) {
            print(e);
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future<String> _Restaurant() async {
    return await rootBundle.loadString('assets/restaurant.json');
  }
}
