import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_of_the_day/pages/introPage.dart';
import 'package:quote_of_the_day/pages/spalsh.dart';
import 'package:quote_of_the_day/provider/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        title: 'Quote Sapient',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const Splash(),
      ),
    );
  }
}
