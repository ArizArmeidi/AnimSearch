import 'package:anim_search/providers/data_provider.dart';
import 'package:anim_search/screens/anime_grid_screen.dart';
import 'package:anim_search/types/category_type.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Future<void> getData(CategoryType category) async {
    await Provider.of<DataProvider>(context, listen: false)
        .getHomeData(category: category);
  }

  void searchData(String query) {
    Provider.of<DataProvider>(context, listen: false).searchData(query);
  }

  Widget _buttonBuilder(String name, int myIndex, CategoryType category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = myIndex;
          getData(category);
        });
      },
      child: FittedBox(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2.5),
          decoration: BoxDecoration(
            color: _selectedIndex == myIndex ? Colors.white : Colors.orange,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.orange,
              width: .8,
            ),
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: _selectedIndex == myIndex ? Colors.orange : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingSearchAppBar(
        colorOnScroll: Colors.white,
        liftOnScrollElevation: 0,
        elevation: 0,
        hideKeyboardOnDownScroll: true,
        title: Container(),
        hint: 'Search anime or manga',
        iconColor: Colors.orange,
        autocorrect: false,
        onFocusChanged: (isFocused) {
          if (!isFocused) {
            setState(() {
              getData(CategoryType.top);
            });
          }
        },
        leadingActions: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: IconButton(
                icon: Icon(
                  Icons.album_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                splashRadius: 25,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                    getData(CategoryType.top);
                  });
                }),
          ),
        ],
        onSubmitted: (query) {
          setState(() {
            _selectedIndex = 0;
            searchData(query);
          });
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 25,
              margin: EdgeInsets.only(bottom: 10),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                children: [
                  _buttonBuilder('Top', 0, CategoryType.top),
                  _buttonBuilder('Upcoming', 1, CategoryType.upcoming),
                  _buttonBuilder('Series', 2, CategoryType.series),
                  _buttonBuilder('Movies', 3, CategoryType.movie),
                  _buttonBuilder('OVA', 4, CategoryType.ova),
                  _buttonBuilder('Special Release', 5, CategoryType.special),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: AnimeGridPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
