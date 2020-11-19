import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_project/ui/components/dummies.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatelessWidget {
  final PageController carouselController;

  const CarouselSlider({Key key, this.carouselController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: PageView.builder(
        controller: carouselController,
        itemCount: slides.length,
        itemBuilder: (BuildContext context, int index) => CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            imageUrl: slides[index],
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => ClipRect(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  blurRadius: 100,
                                  spreadRadius: 100,
                                  offset: Offset(0, 40))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  slidesTitles[index] ?? '',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  slidesDescription[index] ?? '',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .color
                                          .withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            placeholder: (context, url) => Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Center(child: CircularProgressIndicator()),
                )),
      ),
    );
  }
}
