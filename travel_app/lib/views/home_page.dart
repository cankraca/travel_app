import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/asset_constants.dart';
import '../models/places.dart';
import '../widgets/appbar_widgets.dart';
import '../widgets/liked_people.dart';
import '../widgets/more_places.dart';
import '../widgets/my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _places = [];

  bool _isLoaded = false;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/places.json');
    final data = await json.decode(response);
    setState(() {
      _places = data.map((x) => Places.fromJson(x)).toList();
      _isLoaded = _places.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> popularPlaces = _places.where((e) => e.rating > 8.0).toList();

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Leading(),
        actions: [
          Avatar(avatar: AssetConstants.avatar),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Visibility(
          visible: _isLoaded,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending destinations',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Center(
                child: buildPopularPLaces(popularPlaces, context),
              ),
              LikedPeople(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'More Places to Explore',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  InkWell(
                    onTap: () {
                      myBottomSheet(_places, context);
                    },
                    child: Text(
                      'See all',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.blue),
                    ),
                  )
                ],
              ),
              Container(
                height: 150,
                child: buildMorePLaces(_places, 2),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> myBottomSheet(places, BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return buildMorePLaces(places, places.length);
      },
    );
  }

  Widget buildMorePLaces(places, int count) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: MorePlaces(
            image: places[index].picture,
            title: places[index].name,
            subtitle: places[index].place,
          ),
        );
      },
    );
  }

  Widget buildPopularPLaces(places, context) {
    return CarouselSlider.builder(
      itemCount: places.length,
      options: CarouselOptions(
        onPageChanged: (index, reason) {},
        height: MediaQuery.of(context).size.height * 0.35,
        viewportFraction: 0.6,
      ),
      itemBuilder: (context, index, realIndex) {
        return MyCard(
          image: places[index].picture,
          title: places[index].name,
          subtitle: places[index].rating.toString(),
        );
      },
    );
  }
}
