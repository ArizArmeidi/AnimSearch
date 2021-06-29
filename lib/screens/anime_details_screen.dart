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
    final device = MediaQuery.of(context);
    // final screenHeight = device.size.height;
    final screenWidth = device.size.width;
    return Scaffold(
      body: !dataProvider.isLoading
          ? CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Theme.of(context).accentColor,
                  expandedHeight: screenWidth / 1.5,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      animeData.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    centerTitle: true,
                    title: Text(
                      animeData.title,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    animeData.synopsis,
                    style: TextStyle(fontSize: 35),
                  ),
                )
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
