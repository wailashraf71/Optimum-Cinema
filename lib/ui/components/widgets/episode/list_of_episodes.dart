import 'package:cinema_project/ui/components/widgets/episode/episode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListOfEpisodes extends StatelessWidget {
  final List<Map<String, dynamic>> episodes;
  final ScrollController scrollController;

  const ListOfEpisodes(
      {Key key, @required this.episodes, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      child: AnimationLimiter(
        child: ListView.separated(
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: 12),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 5,
              );
            },
            shrinkWrap: true,
            itemCount: episodes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 400),
                child: SlideAnimation(
                  horizontalOffset: 70.0,
                  child: AspectRatio(
                    aspectRatio: 24 / 9,
                    child: EpisodeWidget(
                      image: episodes[index]['image'],
                      title: episodes[index]['title'],
                      season: episodes[index]['season'],
                      number: episodes[index]['number'],
                      seen: episodes[index]['seen'],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
