import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restauran_app/splashscreen/splashscreen.dart';
import 'package:restauran_app/ui/list_resto_screen.dart';
import 'package:restauran_app/ui/page_detail.dart';
import 'ui/search_resto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 3),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Restoran App',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: const ListRestoScreen(),
            routes: {
              DetailPageList.routeName: (context) => DetailPageList(
                    id: ModalRoute.of(context)?.settings.arguments as String,
                  ),
              SearchPageScreen.routeName: (context) => const SearchPageScreen()
            },
          );
        }
      },
    );
  }
}
