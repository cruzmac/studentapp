import 'package:aug_prj/Utils/http_error.dart';
import 'package:aug_prj/models/attendance_model.dart';
import 'package:azlistview/azlistview.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AttendanceRepository {
  static const baseurl = 'http://college.odooformybusiness.com';

  static Uri uri(String path) {
    return Uri.parse('$baseurl/$path');
  }

  Future<List<Attendance>> fetchposts() async {
    try {
      final url = uri('student_attendance');
      final response = await get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final body = jsonDecode(response.body);
        if (body is List) {
          final posts = body.map((e) => Attendance.fromJson(e)).toList();
          SuspensionUtil.sortListBySuspensionTag(posts);
          SuspensionUtil.setShowSuspensionStatus(posts);
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

  static Future updateList(int stud_id, Attendance atten) async {
    try {
      final url = uri('attendance/$stud_id');
      final attendanceMap = {
        'stud_id': stud_id,
        'name': atten.name,
        'attendance': atten.attendance,
      };
      final response = await put(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(attendanceMap));
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
