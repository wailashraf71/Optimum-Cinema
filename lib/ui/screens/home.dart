import 'package:cinema_project/ui/components/dummies.dart';
import 'package:cinema_project/ui/components/widgets/carousel_slider.dart';
import 'package:cinema_project/ui/components/widgets/movie/list_of_movies.dart';
import 'package:cinema_project/ui/components/widgets/series/list_of_series.dart';
import 'package:cinema_project/ui/components/widgets/trailer/list_of_trailers.dart';
import 'package:cinema_project/ui/screens/sub/see_more.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  final drawerFunction;

  const Home({Key key, this.drawerFunction}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  carouselController: pageController,
                ),
                Positioned.fill(
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SmoothPageIndicator(
                                controller: pageController,
                                count: slides.length,
                                effect: ScrollingDotsEffect(
                                  activeDotColor: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color,
                                  dotColor: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.3),
                                  dotWidth: 7,
                                  dotHeight: 7,
                                  paintStyle: PaintingStyle.fill,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            spreadRadius: 10)
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        icon: Icon(FeatherIcons.menu),
                        onPressed: () => widget.drawerFunction(),
                      ),
                    )
                  ],
                )
              ],
            ),
            ListOfMovies(
                title: tr('homeFirstSection'),
                buttonText: tr('more'),
                buttonFunction: () => Get.to(SeeMore()),
                movies: movies),
            SizedBox(height: 35),
            ListOfSeries(
                title: tr('homeSecondSection'),
                buttonText: tr('more'),
                buttonFunction: () => Get.to(SeeMore(isMovies: false)),
                series: series),
            SizedBox(height: 35),
            ListOfMovies(
                title: tr('homeThirdSection'),
                buttonText: tr('more'),
                buttonFunction: () => Get.to(SeeMore()),
                movies: movies.reversed.toList()),
            SizedBox(height: 35),
            ListOfTrailers(
                title: tr('homeForthSection'),
                buttonText: tr('more'),
                buttonFunction: () => Get.to(SeeMore()),
                trailers: trailers),
            SizedBox(height: 35),
            ListOfMovies(
                title: tr('homeFifthSection'),
                buttonText: tr('more'),
                buttonFunction: () => Get.to(SeeMore()),
                movies: movies),
          ],
        ),
      ),
    );
  }
}
