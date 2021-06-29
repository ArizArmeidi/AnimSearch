import 'package:anim_search/models/anime_model.dart';
import 'package:anim_search/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeDetailScreen extends StatefulWidget {
  static const routeName = '/animedetailscreen';

  @override
  _AnimeDetailScreenState createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  var _isInit = true;

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      late int animeId = ModalRoute.of(context)!.settings.arguments as int;
      Provider.of<DataProvider>(context, listen: false).getAnimeData(animeId);
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final AnimeModel animeData = dataProvider.animeData;
    return Scaffold(
      body: !dataProvider.isLoading
          ? Center(
              child: Text(animeData.title),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
