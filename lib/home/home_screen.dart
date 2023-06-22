import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restauran_app/List/ListSceen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 41, 39, 39),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://media.licdn.com/dms/image/D4D1BAQFIoyCGzrvycQ/company-background_10000/0/1656924606412?e=1687413600&v=beta&t=LjPPt7l0Xpzr2FKhNigjwocwSNmPoq7iAzydb50BaEI",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        cursorHeight: 20,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "Search Restaurant...",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Recomended For You",
                      style: GoogleFonts.montserrat(
                          fontSize: 19, color: Colors.white),
                    ),
                  ),
                  //
                  const Expanded(
                    child: ListScreen(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
