import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:restauran_app/data/api/api_service.dart';
import 'package:restauran_app/provider/db_provider.dart';
import 'package:restauran_app/provider/list_detail_provider.dart';
import 'package:restauran_app/provider/scheduling_provider.dart';
import 'package:restauran_app/splashscreen/splashscreen.dart';
import 'package:restauran_app/ui/detail.dart';
import 'package:restauran_app/ui/favorite.dart';
import 'package:restauran_app/ui/home.dart';
import 'package:restauran_app/ui/search.dart';
import 'package:restauran_app/ui/setting.dart';
import 'package:restauran_app/until/bg_service.dart';
import 'common/navigation_bar.dart';
import 'db/db_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final BackgroundService service = BackgroundService();

  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListProvider>(
          create: (_) => ListProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
      ],
      child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 3)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            } else {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Restoran App',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: const MyHomeScreen(),
                navigatorKey: navigatorKey,
                routes: {
                  DetailList.routeName: (context) => DetailList(
                        id: ModalRoute.of(context)?.settings.arguments
                            as String,
                      ),
                  SearchScreen.routeName: (context) => const SearchScreen(),
                  FavoriteScreen.routeName: (context) => const FavoriteScreen(),
                  Settings.routeName: (context) => const Settings(),
                },
              );
            }
          }),
    );
  }
}
