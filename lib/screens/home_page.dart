import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../modals/box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Box> boxList = [];

  lodeJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/Data/boxList.json");

    List res = jsonDecode(jsonData);

    setState(() {
      boxList = res.map((e) => Box.fromJSON(e)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lodeJasonBank();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
        backgroundColor: Colors.blueAccent.withOpacity(0.7),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: StaggeredGrid.count(
            crossAxisCount: 10,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: boxList
                .map(
                  (e) => StaggeredGridTile.count(
                    crossAxisCellCount: e.crossAxisCellCount,
                    mainAxisCellCount: e.mainAxisCellCount,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("all_photos_page", arguments: e);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: NetworkImage(e.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.blueAccent.withOpacity(0.15),
                              child: Text(
                                e.category,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
