import 'package:flutter/material.dart';

class AnimeDetailScreen extends StatelessWidget {
  static const routeName = '/animedetailscreen';
  @override
  Widget build(BuildContext context) {
    late int animeId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Center(
        child: Text(animeId.toString()),
      ),
    );
  }
}
