import 'package:flutter/material.dart';
import 'package:wallpaper_world/modal/wallpaper_model.dart';
import 'package:wallpaper_world/views/imageview.dart';

Widget brandName() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    Text(
      "Wallpaper",
      style: TextStyle(color: Colors.black87),
    ),
    Text(
      "Hub",
      style: TextStyle(color: Colors.blue),
    )
  ]);
}

// ignore: non_constant_identifier_names
Widget WallpaperList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        childAspectRatio: 0.6,
        children: wallpapers.map((wallpaper) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ImageView(imgUrl: wallpaper.src.portrait),
                  ));
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    wallpaper.src.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ));
        }).toList()),
  );
}
