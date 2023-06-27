import 'package:flutter/material.dart';
import 'package:restauran_app/data/model/search_resto.dart';
import 'package:restauran_app/ui/detail.dart';

class ScreenSearch extends StatelessWidget {
  final Restaurant restaurant;

  const ScreenSearch({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailList.routeName,
            arguments: restaurant.id);
      },
      child: Card(
        color: Colors.white54,
        margin: const EdgeInsets.all(15),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Hero(
              tag: restaurant.pictureId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
                  width: 90,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              restaurant.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            subtitle: Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color.fromARGB(255, 241, 3, 11),
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      restaurant.city,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${restaurant.rating}',
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                const Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
