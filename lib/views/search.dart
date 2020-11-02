import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_world/data/data.dart';
import 'package:wallpaper_world/modal/wallpaper_model.dart';
import 'package:wallpaper_world/widget/widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class search extends StatefulWidget {
  final String searchQuery;
  search({this.searchQuery});
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  List<WallpaperModel> wallpapers = new List();
  TextEditingController seachcontroller = new TextEditingController();
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
    getSearchData(widget.searchQuery);
    super.initState();
    seachcontroller.text = widget.searchQuery;
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
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 24.0),
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: seachcontroller,
                          decoration: InputDecoration(
                              hintText: "search wallpaper",
                              border: InputBorder.none),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            getSearchData(seachcontroller.text);
                          },
                          child: Icon(Icons.search)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                WallpaperList(wallpapers: wallpapers, context: context),
              ],
            ),
          ),
        ));
  }
}
