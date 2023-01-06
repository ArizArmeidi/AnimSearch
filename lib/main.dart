import 'package:anim_search/providers/data_provider.dart';
import 'package:anim_search/screens/anime_details_screen.dart';
import 'package:anim_search/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        title: 'AnimSearch',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0,
          ),
          primaryColor: Colors.white, 
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
        ),
        home: HomeScreen(),
        routes: {
          AnimeDetailScreen.routeName: (context) => AnimeDetailScreen(),
        },
      ),
    );
  }
}
