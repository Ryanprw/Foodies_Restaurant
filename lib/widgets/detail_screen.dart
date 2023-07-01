import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:restauran_app/data/model/detail_resto.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenDetail extends StatelessWidget {
  static const routeName = '/detail';
  final LocalDetail resDetailRespon;

  const ScreenDetail({Key? key, required this.resDetailRespon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var restaurant = resDetailRespon.restaurant;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Hero(
                  tag: restaurant.pictureId,
                  child: ClipRRect(
                    child: Image.network(
                      "https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}",
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white54,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color.fromARGB(
                              255,
                              255,
                              1,
                              1,
                            ),
                          ),
                          Text(
                            restaurant.city,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Card(
                        margin: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 30,
                                child: Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 25,
                                ),
                              ),
                              Text(
                                restaurant.rating.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // untuk memperkecil jumlah text agar tidak terlalu memakan space
                  ReadMoreText(
                    restaurant.description,
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    trimLines: 6,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                        255,
                        1,
                        89,
                        161,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Card(
                    shadowColor: Colors.black,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 10,
                    color: Colors.white,
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Foods",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: restaurant.menus.foods.map(
                        (e) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(
                              e.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Card(
                    shadowColor: Colors.white,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 10,
                    color: Colors.white54,
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Drinks",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: restaurant.menus.drinks.map(
                        (e) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(
                              e.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
