import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_project/ui/screens/sub/movie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SearchResult extends StatelessWidget {
  final String title;
  final String image;
  final double rating;

  const SearchResult({Key key, this.title, this.image, this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => Get.to(Movie(
        title: title,
        image: image,
        rating: rating,
      )),
      child: Container(
          height: 180,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: image,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Theme.of(context).primaryColor,
                      highlightColor:
                          Theme.of(context).primaryColor.withOpacity(0.4),
                      child: Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(title ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                  fontSize: 16,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color)),
                          SizedBox(height: 15),
                          Column(
                            children: [
                              Row(
                                children: [
                                  buildText(
                                      text: tr('duration', args: ['2', '36']),
                                      context: context),
                                  SizedBox(width: 5),
                                  Icon(
                                    FeatherIcons.clock,
                                    size: 14,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .color
                                        .withOpacity(0.5),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  buildText(text: '2020', context: context),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child:
                                        buildText(text: '.', context: context),
                                  ),
                                  buildText(
                                      text: 'Adventure/Action',
                                      context: context),
                                ],
                              ),
                            ],
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
                                rating.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 2.2,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .color
                                        .withOpacity(0.5)),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            ],
          )),
    );
  }

  Text buildText({String text, @required BuildContext context}) {
    return Text(
      text ?? '',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12,
        height: 1.5,
        color: Theme.of(context).textTheme.headline1.color.withOpacity(0.5),
      ),
    );
  }
}
