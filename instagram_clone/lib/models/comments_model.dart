// To parse this JSON data, do
//
//     final commentsModel = commentsModelFromJson(jsonString);

import 'dart:convert';

List<CommentsModel> commentsModelFromJson(String str) => List<CommentsModel>.from(json.decode(str).map((x) => CommentsModel.fromJson(x)));

String commentsModelToJson(List<CommentsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentsModel {
    CommentsModel({
        this.username,
        this.comments,
    });

    String username;
    String comments;

    factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        username: json["username"],
        comments: json["comments"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "comments": comments,
    };
}
