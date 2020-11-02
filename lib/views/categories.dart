import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_world/data/data.dart';
import 'package:wallpaper_world/modal/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_world/widget/widget.dart';

class Categories extends StatefulWidget {
  final String CategoryName;
  Categories({this.CategoryName});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<WallpaperModel> wallpapers = new List();
  void getSearchData(String query) async {
    var response = await http.get(
        "https://api.pexels.com/v1/search?query=$query&per_page=300&page=1",
        headers: {"Authorization": apikey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchData(widget.CategoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: brandName(),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                WallpaperList(wallpapers: wallpapers, context: context),
              ],
            ),
          ),
        ));
  }
}
