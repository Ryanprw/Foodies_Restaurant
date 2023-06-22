import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.restaurantID,
    required this.restaurantPICTUREID,
    required this.restaurantNAME,
    required this.restaurantCITY,
    required this.restaurantRATING,
    required this.restaurantDESCRIPTION,
    required this.restaurantFood,
    required this.restaurantDrink,
  }) : super(key: key);

  final String? restaurantID;
  final String? restaurantPICTUREID;
  final String? restaurantNAME;
  final String? restaurantCITY;
  final String? restaurantRATING;
  final String? restaurantDESCRIPTION;
  final List restaurantFood;
  final List restaurantDrink;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int restaurantFood = 0;
  int restaurantDrink = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(children: [
              ClipRRect(
                child: Image.network(
                  '${widget.restaurantPICTUREID}',
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
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
              ),
            ]),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.restaurantNAME}",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                          Container(
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "${widget.restaurantCITY}",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
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
                              Container(
                                width: 30,
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 25,
                                ),
                              ),
                              Text(
                                widget.restaurantRATING.toString(),
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
                    "${widget.restaurantDESCRIPTION}",
                    style: GoogleFonts.montserrat(
                        fontSize: 15, fontWeight: FontWeight.w400),
                    trimLines: 6,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Foods",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 70,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.restaurantFood.length,
                              itemBuilder: (context, index) {
                                final foodName =
                                    widget.restaurantFood[index]["name"];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      restaurantFood = index;
                                    });
                                  },
                                  //bagian membuat list food yang bisa berpindah" warna jika di klik
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 10,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: restaurantFood == index
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      foodName,
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: restaurantFood == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Drinks",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 70,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.restaurantDrink.length,
                              itemBuilder: (context, index) {
                                final foodName =
                                    widget.restaurantDrink[index]["name"];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      restaurantDrink = index;
                                    });
                                  },
                                  //bagian membuat list food yang bisa berpindah" warna jika di klik
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 10,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: restaurantDrink == index
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      foodName,
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: restaurantDrink == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
