import 'package:flutter/material.dart';

import '../image_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    final screenHeight = device.size.height;
    final screenWidth = device.size.width;

    return Scaffold(
      backgroundColor: Colors.red,
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
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: imageList.length,
          itemBuilder: (context, index) => ImageCard(
            imageData: imageList[index],
            cardIndex: index,
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final ImageData? imageData;
  final int cardIndex;

  ImageCard({
    this.imageData,
    this.cardIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        imageData!.imageUrl ?? '',
        fit: BoxFit.cover,
      ),
    );
  }
}
