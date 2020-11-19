import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_project/ui/components/dummies.dart';
import 'package:cinema_project/ui/components/widgets/movie/list_of_movies.dart';
import 'package:cinema_project/ui/screens/sub/play.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class Movie extends StatefulWidget {
  final int id;
  final String title;
  final double rating;
  final String image;

  const Movie({Key key, this.id, this.image, this.title, this.rating})
      : super(key: key);

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  get title => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 600,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.image ?? '',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                  Positioned.fill(
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              blurRadius: 100,
                              spreadRadius: 100,
                              offset: Offset(0, 40))
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title ?? '',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Icon(
                                    FeatherIcons.star,
                                    color: Color(0xffFFC312),
                                    size: 18,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    widget.rating.toString() ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        height: 1.6,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .color),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FeatherIcons.clock,
                                    size: 18,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '2h 29min',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        height: 1.6,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .color),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      AppBar(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                            icon: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.arrow_back),
                            ),
                            onPressed: () => Get.back()),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            buildActions(),
            SizedBox(height: 25),
            buildDetails(),
            SizedBox(height: 25),
            ListOfMovies(title: tr('recommended'), movies: movies),
          ],
        ),
      ),
    );
  }

  Widget buildActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.to(Play()),
              color: Theme.of(context).accentColor.withOpacity(0.75),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FeatherIcons.play, size: 18),
                      SizedBox(width: 5),
                      Text(tr('play', args: ['']),
                          style: TextStyle(
                              height: 2.2,
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                    ],
                  )),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.to(Play()),
              child: FlatButton(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context)
                            .textTheme
                            .headline1
                            .color
                            .withOpacity(0.3),
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(7)),
                onPressed: () {},
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FeatherIcons.download, size: 18),
                        SizedBox(width: 5),
                        Text(tr('download'),
                            style: TextStyle(
                                height: 2.2,
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDetails() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          buildRecord(title: tr('releaseDate'), value: 'September 16, 2020'),
          buildRecord(title: tr('director'), value: 'Harry Bradbeer'),
          buildRecord(
              title: tr('cast'),
              value: 'Millie Bobby Brown, Louis Partridge, Henry Cavill'),
          SizedBox(height: 30),
          Text(
            tr('description'),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
          ),
          SizedBox(height: 5),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: TextStyle(
                fontSize: 12.5,
                color: Theme.of(context)
                    .textTheme
                    .headline1
                    .color
                    .withOpacity(0.7)),
          )
        ]),
      ),
    );
  }

  Row buildRecord({String title, String value, bool bright = false}) {
    return Row(
      children: [
        Text(
          title ?? '',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        SizedBox(width: 5),
        Text(
          value ?? '',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              height: 1.25,
              color: bright
                  ? Theme.of(context).textTheme.headline1.color
                  : Theme.of(context)
                      .textTheme
                      .headline1
                      .color
                      .withOpacity(0.5)),
        ),
      ],
    );
  }
}
