import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:restauran_app/data/model/detail_resto.dart';

class ScreenDetail extends StatefulWidget {
  static const routeName = '/screen-detail';

  final Restaurant restaurant;

  const ScreenDetail({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<ScreenDetail> createState() => _ScreenDetailState();
}

class _ScreenDetailState extends State<ScreenDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 145, 80),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.restaurant.pictureId,
                  child: ClipRRect(
                    child: Image.network(
                        "https://restaurant-api.dicoding.dev/images/large/${widget.restaurant.pictureId}"),
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
                    widget.restaurant.name,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                            color: Color.fromARGB(255, 255, 1, 1),
                          ),
                          Text(
                            widget.restaurant.city,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
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
                                widget.restaurant.rating.toString(),
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
                    widget.restaurant.description,
                    style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    trimLines: 6,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 89, 161),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Card(
                    shadowColor: Colors.black,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 10,
                    color: Colors.white54,
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
                      children: widget.restaurant.menus.foods.map(
                        (e) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 12, 145, 80),
                            ),
                            child: Text(
                              e.name,
                              style: const TextStyle(
                                color: Colors.white,
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
                    shadowColor: Colors.black,
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
                      children: widget.restaurant.menus.drinks.map(
                        (e) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 12, 145, 80),
                            ),
                            child: Text(
                              e.name,
                              style: const TextStyle(
                                color: Colors.white,
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
