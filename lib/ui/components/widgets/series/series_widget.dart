import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_project/ui/screens/sub/series.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

class SeriesWidget extends StatelessWidget {
  final String title;
  final int seasons;
  final String image;
  final int episodes;

  const SeriesWidget(
      {Key key, this.title, this.image, this.seasons = 1, this.episodes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Get.to(Series(
            id: 1,
            image: image,
            title: title,
            seasons: seasons,
            episodes: episodes));
      },
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    width: double.infinity,
                    height: double.infinity,
                    imageUrl: image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Theme.of(context).primaryColor,
                      highlightColor:
                          Theme.of(context).primaryColor.withOpacity(0.4),
                      child: Container(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.82),
                              offset: Offset(0, 30),
                              spreadRadius: 30,
                              blurRadius: 30)
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: LinearPercentIndicator(
                      animation: true,
                      lineHeight: 4.0,
                      animationDuration: 1000,
                      percent: 0.8,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Theme.of(context).accentColor,
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.headline1.color),
          ),
          if (seasons != null)
            Text(
              tr('seasonsCount', args: ['$seasons']),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context)
                      .textTheme
                      .headline1
                      .color
                      .withOpacity(0.8)),
            ),
        ],
      ),
    );
  }
}
