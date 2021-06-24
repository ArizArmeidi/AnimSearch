import 'package:anim_search/models/home_card_model.dart';
import 'package:anim_search/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../image_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).getHomeData();
  }

  Widget _cardBuilder({
    final HomeCardModel? data,
    final int cardIndex = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        data!.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    final screenHeight = device.size.height;
    // final screenWidth = device.size.width;
    final homeData = Provider.of<DataProvider>(context).searchList;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.animation,
          color: Theme.of(context).accentColor,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        height: screenHeight,
        child: GridView.builder(
          padding: EdgeInsets.all(15).copyWith(
            left: 20,
            right: 20,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5 / 2.5,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: imageList.length,
          itemBuilder: (context, index) => _cardBuilder(
            data: homeData[index],
            cardIndex: index,
          ),
        ),
      ),
    );
  }
}
