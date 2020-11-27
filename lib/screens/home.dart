import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phone_shop_online/models/categories.dart';
import 'package:phone_shop_online/shareds/constantes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Categories _categories = Categories();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              // Custom App Bar
              _CustomAppBar(),
              Positioned(
                bottom: 0.0,
                child: Container(
                  height: size.height * 0.85,
                  width: size.width,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Market name
                        Row(
                          children: <Widget>[
                            Text('Nassim',
                                style: TextStyle(
                                    color: darkBlue,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: -1)),
                            SizedBox(width: 2.0),
                            Text('Mart',
                                style: TextStyle(
                                    color: orange,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: -1)),
                          ],
                        ),
                        Text('Online Shopping Mart',
                            style: TextStyle(color: darkGrey)),
                        SizedBox(height: 30.0),
                        //Categories Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Categories',
                              style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            // See all button
                            GestureDetector(
                              onTap: () {
                                print('See All');
                              },
                              child: Text(
                                'See All',
                                style:
                                    TextStyle(color: lightBlue, fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          height: size.height * 0.05,
                          width: size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _categories.categories.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 15.0),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 5.0),
                                  decoration: BoxDecoration(
                                      color: index == _selectedIndex
                                          ? lightBlue
                                          : lightGrey,
                                      borderRadius:
                                          BorderRadius.circular(22.0)),
                                  child: Text(
                                    _categories.categories[index],
                                    style: TextStyle(
                                        color: index == _selectedIndex
                                            ? Colors.white
                                            : darkGrey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Expanded(
                          child: Container(
                            child: ListView(
                              children: <Widget>[
                                CarouselSlider(
                                    options: CarouselOptions(
                                        height: size.height * 0.3,
                                        autoPlay: true,
                                        autoPlayAnimationDuration:
                                            Duration(seconds: 2),
                                        aspectRatio: 16 / 9,
                                        viewportFraction: 0.8,
                                        autoPlayInterval: Duration(seconds: 5),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true),
                                    items: [
                                      Container(
                                        width: size.width,
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://i0.wp.com/9to5google.com/wp-content/uploads/sites/4/2020/08/samsung_galaxy_note_20_ultra_5.jpg?w=2000&quality=82&strip=all&ssl=1')),
                                      ),
                                      Container(
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://i0.wp.com/9to5google.com/wp-content/uploads/sites/4/2020/08/samsung_galaxy_note_20_ultra_5.jpg?w=2000&quality=82&strip=all&ssl=1')),
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

// custom app bar

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Positioned(
      top: 0.0,
      child: Container(
        height: size.height * 0.1,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.panorama_wide_angle,
                color: darkGrey,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            _SmallSearchBar(),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: darkGrey,
                size: 30.0,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// Home Search bar

class _SmallSearchBar extends StatelessWidget {
  const _SmallSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        print('open search screen');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        height: size.height * 0.05,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Search', style: TextStyle(color: darkGrey)),
            Icon(Icons.search, color: lightBlue),
          ],
        ),
      ),
    );
  }
}
