import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_project/ui/screens/sub/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MovieWidget extends StatelessWidget {
  final String title;
  final double rating;
  final String image;
  final BorderRadiusGeometry radius;

  const MovieWidget({Key key, this.title, this.image, this.radius, this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Get.to(Movie(id: 1, image: image, title: title, rating: rating));
      },
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: radius,
              child: CachedNetworkImage(
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
            ),
          ),
          if (title != null)
            Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 2),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).textTheme.headline1.color),
                  ),
                )),
          if (rating != null)
            Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 1, left: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            child: Container(
                                width: 35,
                                child: Image.asset('assets/images/imdb.png')),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          SizedBox(width: 5),
                          Text(
                            rating.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                height: 1.5,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .color
                                    .withOpacity(0.34)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            FeatherIcons.eye,
                            size: 17,
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                .color
                                .withOpacity(0.7),
                          ),
                          SizedBox(width: 5),
                          Text(
                            314.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                height: 1.8,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .color
                                    .withOpacity(0.34)),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
        ],
      ),
    );
  }
}
