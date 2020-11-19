import 'package:cinema_project/ui/components/dummies.dart';
import 'package:cinema_project/ui/components/widgets/search/search_bar.dart';
import 'package:cinema_project/ui/components/widgets/search/search_result.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.black12,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Hero(
          tag: 'searchBar',
          child: SearchBar(
            searchController: TextEditingController(),
            preview: false,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              tr('searchResults', args: ['${movies.length}']),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15,
                  height: 2.2,
                  color: Theme.of(context).textTheme.headline1.color),
            ),
          ),
          Expanded(
              child: AnimationLimiter(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 275),
                  child: SlideAnimation(
                      verticalOffset: 45.0,
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: SearchResult(
                            title: movies[index]['title'],
                            image: movies[index]['image'],
                            rating: movies[index]['rate'],
                          ))),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
