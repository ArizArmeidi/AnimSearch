import 'package:anim_search/models/anime_model.dart';
import 'package:flutter/material.dart';

class AnimeDetailsHeader extends StatelessWidget {
  late final AnimeModel animeData;
  AnimeDetailsHeader({required this.animeData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  animeData.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  animeData.titleEnglish,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  animeData.airingDate,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  animeData.rating,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.orange,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                '${animeData.score}',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  backgroundColor: Colors.grey.withOpacity(.35),
                  strokeWidth: 6.0,
                  value: animeData.score / 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
