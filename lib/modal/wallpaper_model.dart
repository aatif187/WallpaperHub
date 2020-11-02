class WallpaperModel {
  String photographer;
  String photographer_url;
  int photographer_id;
  SrcModel src;
  String url;
  WallpaperModel(
      {this.url,
      this.src,
      this.photographer_url,
      this.photographer_id,
      this.photographer});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        src: SrcModel.fromMap(jsonData['src']),
        photographer: jsonData['photographer'],
        photographer_id: jsonData['photographer_id'],
        photographer_url: jsonData['photographer_url'],
        url: jsonData['url']);
  }
}

class SrcModel {
  String original;
  String small;
  String portrait;
  SrcModel({this.portrait, this.original, this.small});
  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      original: jsonData['original'],
      portrait: jsonData['portrait'],
      small: jsonData['small'],
    );
  }
}
