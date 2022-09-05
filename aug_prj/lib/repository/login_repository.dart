import 'dart:ffi';

import 'package:aug_prj/Utils/http_error.dart';
import 'package:aug_prj/models/loginmodel.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoginRepository {
  static const baseurl = 'https://jsonplaceholder.typicode.com';

  Uri uri(String path) {
    return Uri.parse('$baseurl/$path');
  }

  Future<List<LogIn>> fetchposts() async {
    try {
      final url = uri('posts');
      final response = await get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final body = jsonDecode(response.body);
        if (body is List) {
          final posts = body.map((e) => LogIn.fromJson(e)).toList();
          return posts;
        } else {
          return [];
        }
      } else {
        throw HttpError('ERROR');
      }
    } catch (e) {
      throw HttpError(e.toString());
    }
  }

  Future<LogIn> fetchpost(int id) async {
    try {
      final url = uri('post/$id');
      final response = await get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final body = jsonDecode(response.body);
        if (body is Map) {
          final json = Map<String, dynamic>.from(body);
          final login = LogIn.fromJson(json);
          return login;
        } else {
          return LogIn();
        }
      } else {
        throw HttpError(' ERROR ');
      }
    } catch (e) {
     throw HttpError('ERROR');
    }
  }
}
