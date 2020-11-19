import 'package:cinema_project/ui/components/dummies.dart';
import 'package:cinema_project/ui/components/widgets/movie/grid_of_movies.dart';
import 'package:cinema_project/ui/components/widgets/series/grid_of_series.dart';
import 'package:flutter/material.dart';

class SeeMore extends StatelessWidget {
  final bool isMovies;

  const SeeMore({Key key, this.isMovies = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Adventure',
          style:
              TextStyle(fontWeight: FontWeight.w700, height: 2.2, fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: isMovies
                ? GridOfMovies(
                    movies: movies,
                  )
                : GridOfSeries(series: series),
          ),
        ],
      ),
    );
  }
}
