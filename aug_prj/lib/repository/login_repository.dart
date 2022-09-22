import 'dart:ffi';
import 'package:aug_prj/Utils/http_error.dart';
import 'package:aug_prj/models/loginmodel.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoginRepository {
  static const baseurl = 'https://flutter.odooformybusiness.com';

  static Uri uri(String path) {
    return Uri.parse('$baseurl/$path');
  }

  Future<List<LogIn>> fetchposts() async {
    try {
      final url = uri('users');
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
        throw HttpError('ERROR is made');
      }
    } catch (e) {
      throw HttpError(e.toString());
    }
  }

  Future<LogIn> fetchpost(int id) async {
    try {
      final url = uri('users/$id');
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

  static Future<void> deleteAcct(int id) async {
    try {
      final url = uri('users/$id');
      final response = await delete(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final body = response.body;
        print(body);
      } else {
        throw HttpError('ERROR is 1');
      }
    } catch (e) {
      throw HttpError('ERROR is 2');
    }
  }

  static Future updateList(int id, LogIn login) async {
    try {
      final url = uri('/$id');
      final loginMap = {
        'firstname': login.firstname,
        'lastname': login.lastname,
      };
      final response = await patch(url,
          headers: {
            'Content-type': 'application/json',
          },
          body: jsonEncode(loginMap));
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
        throw HttpError(
          'Something went wrong. Please try again after some time',
        );
      }
    } catch (e) {
      throw HttpError(
        'Something went wrong. Please try again after some time',
      );
    }
  }

  static Future createlogin(Map<String,String> loginMap) async {
    try {
      final url = uri('users');
      final response = await post(url,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: loginMap);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final body = response.body;
        print(body);
      } else {
        throw HttpError('ERROR');
      }
    } catch (e) {
      throw HttpError(
        'Something went wrong. Please try again after some time',
      );
    }
  }
}
