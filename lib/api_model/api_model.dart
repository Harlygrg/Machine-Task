
import 'dart:convert';

ImageDisplayModel imageDisplayModelFromJson(String str) => ImageDisplayModel.fromJson(json.decode(str));

String imageDisplayModelToJson(ImageDisplayModel data) => json.encode(data.toJson());

class ImageDisplayModel {
  ImageDisplayModel({
    this.total,
    this.totalHits,
    this.hits,
  });

  int ?total;
  int ?totalHits;
  List<Hit> ?hits;

  factory ImageDisplayModel.fromJson(Map<String, dynamic> json) => ImageDisplayModel(
    total: json["total"],
    totalHits: json["totalHits"],
    hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "totalHits": totalHits,
    "hits": List<dynamic>.from(hits!.map((x) => x.toJson())),
  };
}

class Hit {
  Hit({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  int ?id;
  String ?pageUrl;
  Type ?type;
  String ?tags;
  String ?previewUrl;
  int ?previewWidth;
  int ?previewHeight;
  String ?webformatUrl;
  int ?webformatWidth;
  int ?webformatHeight;
  String ?largeImageUrl;
  int ?imageWidth;
  int ?imageHeight;
  int ?imageSize;
  int ?views;
  int ?downloads;
  int ?collections;
  int ?likes;
  int ?comments;
  int ?userId;
  String ?user;
  String ?userImageUrl;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
    id: json["id"],
    pageUrl: json["pageURL"],
    type: typeValues.map[json["type"]],
    tags: json["tags"],
    previewUrl: json["previewURL"],
    previewWidth: json["previewWidth"],
    previewHeight: json["previewHeight"],
    webformatUrl: json["webformatURL"],
    webformatWidth: json["webformatWidth"],
    webformatHeight: json["webformatHeight"],
    largeImageUrl: json["largeImageURL"],
    imageWidth: json["imageWidth"],
    imageHeight: json["imageHeight"],
    imageSize: json["imageSize"],
    views: json["views"],
    downloads: json["downloads"],
    collections: json["collections"],
    likes: json["likes"],
    comments: json["comments"],
    userId: json["user_id"],
    user: json["user"],
    userImageUrl: json["userImageURL"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pageURL": pageUrl,
    "type": typeValues.reverse[type],
    "tags": tags,
    "previewURL": previewUrl,
    "previewWidth": previewWidth,
    "previewHeight": previewHeight,
    "webformatURL": webformatUrl,
    "webformatWidth": webformatWidth,
    "webformatHeight": webformatHeight,
    "largeImageURL": largeImageUrl,
    "imageWidth": imageWidth,
    "imageHeight": imageHeight,
    "imageSize": imageSize,
    "views": views,
    "downloads": downloads,
    "collections": collections,
    "likes": likes,
    "comments": comments,
    "user_id": userId,
    "user": user,
    "userImageURL": userImageUrl,
  };
}

enum Type { PHOTO }

final typeValues = EnumValues({
  "photo": Type.PHOTO
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
















// To parse this JSON data, do
//
//     final imageDisplayModel = imageDisplayModelFromJson(jsonString);



// class ImageModel {
//   ImageModel({
//     required this.total,
//     required this.totalHits,
//     required this.hits,
//   });
//   late final int total;
//   late final int totalHits;
//   late final List<Hits> hits;
//
//   ImageModel.fromJson(Map<String, dynamic> json){
//     total = json['total'];
//     totalHits = json['totalHits'];
//     hits = List.from(json['hits']).map((e)=>Hits.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['total'] = total;
//     _data['totalHits'] = totalHits;
//     _data['hits'] = hits.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Hits {
//   Hits({
//     required this.id,
//     required this.pageURL,
//     required this.type,
//     required this.tags,
//     required this.previewURL,
//     required this.previewWidth,
//     required this.previewHeight,
//     required this.webformatURL,
//     required this.webformatWidth,
//     required this.webformatHeight,
//     required this.largeImageURL,
//     required this.imageWidth,
//     required this.imageHeight,
//     required this.imageSize,
//     required this.views,
//     required this.downloads,
//     required this.collections,
//     required this.likes,
//     required this.comments,
//     required this.userId,
//     required this.user,
//     required this.userImageURL,
//   });
//   late final int id;
//   late final String pageURL;
//   late final String type;
//   late final String tags;
//   late final String previewURL;
//   late final int previewWidth;
//   late final int previewHeight;
//   late final String webformatURL;
//   late final int webformatWidth;
//   late final int webformatHeight;
//   late final String largeImageURL;
//   late final int imageWidth;
//   late final int imageHeight;
//   late final int imageSize;
//   late final int views;
//   late final int downloads;
//   late final int collections;
//   late final int likes;
//   late final int comments;
//   late final int userId;
//   late final String user;
//   late final String userImageURL;
//
//   Hits.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     pageURL = json['pageURL'];
//     type = json['type'];
//     tags = json['tags'];
//     previewURL = json['previewURL'];
//     previewWidth = json['previewWidth'];
//     previewHeight = json['previewHeight'];
//     webformatURL = json['webformatURL'];
//     webformatWidth = json['webformatWidth'];
//     webformatHeight = json['webformatHeight'];
//     largeImageURL = json['largeImageURL'];
//     imageWidth = json['imageWidth'];
//     imageHeight = json['imageHeight'];
//     imageSize = json['imageSize'];
//     views = json['views'];
//     downloads = json['downloads'];
//     collections = json['collections'];
//     likes = json['likes'];
//     comments = json['comments'];
//     userId = json['user_id'];
//     user = json['user'];
//     userImageURL = json['userImageURL'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['pageURL'] = pageURL;
//     _data['type'] = type;
//     _data['tags'] = tags;
//     _data['previewURL'] = previewURL;
//     _data['previewWidth'] = previewWidth;
//     _data['previewHeight'] = previewHeight;
//     _data['webformatURL'] = webformatURL;
//     _data['webformatWidth'] = webformatWidth;
//     _data['webformatHeight'] = webformatHeight;
//     _data['largeImageURL'] = largeImageURL;
//     _data['imageWidth'] = imageWidth;
//     _data['imageHeight'] = imageHeight;
//     _data['imageSize'] = imageSize;
//     _data['views'] = views;
//     _data['downloads'] = downloads;
//     _data['collections'] = collections;
//     _data['likes'] = likes;
//     _data['comments'] = comments;
//     _data['user_id'] = userId;
//     _data['user'] = user;
//     _data['userImageURL'] = userImageURL;
//     return _data;
//   }
// }




