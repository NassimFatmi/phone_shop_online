import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phone_shop_online/models/models.dart';
import 'package:phone_shop_online/shareds/constantes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Categories _categories = Categories();
  Add adds = Add();
  BrandsList phoneBrands = BrandsList();
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
                            Text('Nas',
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
                        SizedBox(height: 5.0),
                        Text('Online Shopping Mart',
                            style: TextStyle(color: darkGrey)),
                        SizedBox(height: 40.0),
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
                        SizedBox(height: 40.0),

                        // Categories slider

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
                                _Swiper(adverts: adds),
                                SizedBox(height: 30.0),
                                _MarksListView(marks: phoneBrands),
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

// brands List view maker

class _MarksListView extends StatelessWidget {
  final BrandsList marks;
  const _MarksListView({
    Key key,
    this.marks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: marks.brands.length,
          itemBuilder: (context, index) {
            return _MarkItem(brand: marks.brands[index]);
          },
        ));
  }
}

// brand items

class _MarkItem extends StatelessWidget {
  final Mark brand;
  const _MarkItem({
    Key key,
    this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      height: 150,
      width: 160,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              alignment: Alignment.center,
              height: 110,
              width: 160,
              decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: NetworkImage(brand.markLogo), fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            bottom: 10.0,
            child: Container(
              child: Text(
                brand.markName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkBlue,
                    fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Home screen swiper widget

class _Swiper extends StatelessWidget {
  final Add adverts;
  const _Swiper({Key key, this.adverts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.3,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            viewportFraction: 1,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true),
        itemCount: adverts.url.length,
        itemBuilder: (context, index) {
          return _AddPost(imageUrl: adverts.url[index]);
        });
  }
}

// Item for the home screen add Swiper

class _AddPost extends StatelessWidget {
  final String imageUrl;
  const _AddPost({
    Key key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Open add tab');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(20),
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
      ),
    );
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
                Icons.menu,
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
