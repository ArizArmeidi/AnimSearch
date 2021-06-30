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
    final screenHeight = device.size.height;
    final screenWidth = device.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.orange,
      body: !dataProvider.isLoading
          ? Container(
              child: Stack(
                children: [
                  Container(
                    height: screenWidth / 1.25,
                    width: screenWidth,
                    child: Image.network(
                      animeData.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    color: Colors.orange,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenWidth / 1.5),
                    child: Expanded(
                      child: SingleChildScrollView(
                        clipBehavior: Clip.none,
                        child: Container(
                          width: screenWidth,
                          height: screenHeight,
                          padding: EdgeInsets.all(25).copyWith(top: 35),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      animeData.title,
                                      style: TextStyle(
                                        fontSize: 25,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
