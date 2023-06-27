import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restauran_app/ui/detail.dart';

import '../data/model/restaurant.dart';

class CardScreen extends StatelessWidget {
  final Restaurant resto;

  const CardScreen({super.key, required this.resto});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailList.routeName,
          arguments: resto.id,
        );
      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 250,
              child: Stack(
                children: [
                  Card(
                    color: Colors.white54,
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
                            "https://restaurant-api.dicoding.dev/images/medium/${resto.pictureId}",
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            resto.name,
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
                                color: Colors.red,
                              ),
                              Text(
                                resto.city,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(fontSize: 15),
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
                                resto.rating.toString(),
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
    );
  }
}
