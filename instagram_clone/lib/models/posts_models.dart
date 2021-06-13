// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'dart:convert';

List<PostsModel> postsModelFromJson(String str) => List<PostsModel>.from(json.decode(str).map((x) => PostsModel.fromJson(x)));

String postsModelToJson(List<PostsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsModel {
    PostsModel({
        this.id,
        this.channelname,
        this.title,
        this.highThumbnail,
        this.lowThumbnail,
        this.mediumThumbnail,
        // this.tags,
    });

    String id;
    String channelname;
    String title;
    String highThumbnail;
    String lowThumbnail;
    String mediumThumbnail;
    // List<dynamic> tags;

    factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        id: json["id"],
        channelname: json["channelname"],
        title: json["title"],
        highThumbnail: json["high thumbnail"],
        lowThumbnail: json["low thumbnail"],
        mediumThumbnail: json["medium thumbnail"],
        // tags: List<dynamic>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "channelname": channelname,
        "title": title,
        "high thumbnail": highThumbnail,
        "low thumbnail": lowThumbnail,
        "medium thumbnail": mediumThumbnail,
        // "tags": List<dynamic>.from(tags.map((x) => x)),
    };
}
