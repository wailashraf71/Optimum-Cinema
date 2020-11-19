import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cinema_project/ui/components/dummies.dart';
import 'package:cinema_project/ui/components/widgets/movie/grid_of_movies.dart';
import 'package:cinema_project/ui/components/widgets/series/grid_of_series.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  final int initialIndex;

  const Category({Key key, this.initialIndex = 0}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController = new TabController(
        length: 2, vsync: this, initialIndex: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Adventure',
            style: TextStyle(
                fontWeight: FontWeight.w700, height: 2.2, fontSize: 22),
          ),
          bottom: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              labelStyle: TextStyle(
                  height: 2.2,
                  fontSize: 15,
                  fontFamily: GoogleFonts.tajawal().fontFamily,
                  fontWeight: FontWeight.w700),
              indicator: BubbleTabIndicator(
                indicatorHeight: 30.0,
                indicatorColor: Theme.of(context).indicatorColor,
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ),
              tabs: [Text('Movies').tr(), Text('Series').tr()]),
        ),
        body: TabBarView(controller: _tabController, children: <Widget>[
          Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: GridOfMovies(movies: movies),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: GridOfSeries(series: series),
              ),
            ],
          ),
        ]));
  }
}
