import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AllPhotosPage extends StatefulWidget {
  const AllPhotosPage({Key? key}) : super(key: key);

  @override
  State<AllPhotosPage> createState() => _AllPhotosPageState();
}

class _AllPhotosPageState extends State<AllPhotosPage> {
  int photoIndex = 0;
  bool autoPlay = false;

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    List images = res.images as List;
    return Scaffold(
      appBar: AppBar(
        title: Text(res.category),
        backgroundColor: Colors.blueAccent.withOpacity(0.7),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            autoPlay = !autoPlay;
          });
        },
        backgroundColor: Colors.blueAccent.withOpacity(0.85),
        child: Icon((autoPlay) ? Icons.pause : Icons.play_arrow),
      ),
      body: Container(
        color: Colors.blueAccent.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: autoPlay,
                initialPage: photoIndex,
                clipBehavior: Clip.hardEdge,
                onPageChanged: (i, _) {
                  setState(() {
                    photoIndex = i;
                  });
                },
                height: MediaQuery.of(context).size.height * 0.61,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: images.map((e) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.37),
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: NetworkImage(e),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            AnimatedSmoothIndicator(
              activeIndex: photoIndex,
              count: images.length,
              effect: const WormEffect(),
            )
          ],
        ),
      ),
    );
  }
}
