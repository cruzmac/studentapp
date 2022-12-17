import 'package:aug_prj/Utils/http_error.dart';
import 'package:aug_prj/models/attendance_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AttendanceRepository {
  static const baseurl = 'https://flutter.odooformybusiness.com';

  static Uri uri(String path) {
    return Uri.parse('$baseurl/$path');
  }

  Future<List<Attendance>> fetchposts() async {
    try {
      final url = uri('users');
      final response = await get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final body = jsonDecode(response.body);
        if (body is List) {
          final posts = body.map((e) => Attendance.fromJson(e)).toList();
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

  Future<Attendance> fetchpost(int id) async {
    try {
      final url = uri('users/$id');
      final response = await get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final body = jsonDecode(response.body); 
        if (body is Map) {
          final json = Map<String, dynamic>.from(body);
          final login = Attendance.fromJson(json);
          return login;
        } else {
          return Attendance();
        }
      } else {
        throw HttpError(' ERROR ');
      }
    } catch (e) {
      throw HttpError('ERROR');
    }
  }

  static Future updateList(int id, Attendance atten) async {
    try {
      final url = uri('users/$id');
      final loginMap = {
        'id': id,
        'stu_name': atten.std_name,
        'is_present': atten.ispresent,
      };
      final response = await put(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(loginMap));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final body = response.body;
      } else {
        throw HttpError(
          'Something went wrong1',
        );
      }
    } catch (e) {
      throw HttpError(
        'Something went wrong. Please try again after some time',
      );
    }
  }
}
