import 'package:flutter/material.dart';
import 'package:image_gallary/screens/all_photos_page.dart';
import 'package:image_gallary/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "all_photos_page": (context) => const AllPhotosPage(),
      },
    ),
  );
}
