import 'package:anim_search/providers/data_provider.dart';
import 'package:anim_search/screens/top_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Future<void> getData() async {
    await Provider.of<DataProvider>(context, listen: false).getHomeData();
  }

  void searchData(String query) {
    Provider.of<DataProvider>(context, listen: false).searchData(query);
  }

  Widget _buttonBuilder(String name, int myIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = myIndex;
        });
      },
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
        leadingActions: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: IconButton(
              icon: Icon(
                Icons.animation_outlined,
                color: Theme.of(context).accentColor,
              ),
              splashRadius: 25,
              onPressed: getData,
            ),
          ),
        ],
        onSubmitted: (query) => searchData(query),
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
                  _buttonBuilder('Top', 0),
                  _buttonBuilder('Upcoming', 1),
                  _buttonBuilder('Series', 2),
                  _buttonBuilder('Movie', 3),
                  _buttonBuilder('Movie', 3),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 270,
                child: _selectedIndex == 0
                    ? TopPage()
                    : _selectedIndex == 1
                        ? Container(
                            color: Colors.red,
                          )
                        : _selectedIndex == 2
                            ? Container(
                                color: Colors.grey,
                              )
                            : Container(
                                color: Colors.amber,
                              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
