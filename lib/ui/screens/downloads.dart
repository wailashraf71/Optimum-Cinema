import 'package:cinema_project/ui/components/dummies.dart';
import 'package:cinema_project/ui/components/widgets/movie/grid_of_movies.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Downloads extends StatefulWidget {
  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.black12,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(tr('thirdPageTitle'),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: GridOfMovies(
              movies: movies,
              moviePerLine: 2,
              slide: false,
            ),
          ),
        ],
      ),
    );
  }
}
