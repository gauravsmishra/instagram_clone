import 'dart:async';
import 'dart:convert';

import 'dart:io';

import 'package:instagram_clone/models/comments_model.dart';
import 'package:instagram_clone/models/posts_models.dart';

import 'api_exception.dart';
import 'network_utils.dart';
import 'package:http/http.dart' as http;

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final POSTS_URL =
      "https://hiit.ria.rocks/videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas";
  static final COMMENTS_URL = "http://cookbookrecipes.in/test.php";

  Future<List<PostsModel>> getPostsServices() async {
    var url = POSTS_URL;
    print("getPosts:" + url);
    var data = await apiCall(url);
    print(data);
    return postsModelFromJson(data);
  }

  Future<List<CommentsModel>> getCommentsServices() async {
    var url = COMMENTS_URL;
    print("getPosts:" + url);
    var data = await apiCall(url);
    print(data);
    return commentsModelFromJson(data);
  }

  Future<dynamic> apiCall(String url) async {
    try {
      var res = await http.get(Uri.parse(url));
      return returnResponse(res);
    } on SocketException {
      throw AppException('No Internet connection');
    } on HttpException {
      throw AppException("Couldn't find the post");
    } on FormatException {
      throw AppException("Bad response format");
    }
  }

  static dynamic returnResponse(http.Response response) {
    // print("Response code: " + response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        var res = response.body.toString();
        return res;
      case 400:
        throw BadRequestException("Bad request");
      case 401:
      case 403:
        throw UnauthorisedException("Incorrect username or password");
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
