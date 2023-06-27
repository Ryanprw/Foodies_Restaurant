import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restauran_app/splashscreen/splashscreen.dart';
import 'package:restauran_app/ui/list_screen.dart';
import 'package:restauran_app/ui/detail.dart';
import 'ui/search.dart';

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
            title: 'Restauran App',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: const ListScreen(),
            routes: {
              DetailList.routeName: (context) => DetailList(
                    id: ModalRoute.of(context)?.settings.arguments as String,
                  ),
              SearchScreen.routeName: (context) => const SearchScreen()
            },
          );
        }
      },
    );
  }
}
