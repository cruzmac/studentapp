import 'package:azlistview/azlistview.dart';

class Attendance extends ISuspensionBean {
  String? stud_id;
  String? name;
  late bool? attendance;
  String? tag;

  Attendance({this.stud_id, this.name, this.attendance, this.tag});

  Attendance.fromJson(Map<String, dynamic> json) {
    stud_id = json['stud_id'];
    name = json['name'];
    attendance = json['attendance'];
    tag = name![0].toUpperCase();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['stud_id'] = stud_id;
    data['name'] = name;
    data['attendance'] = attendance;
    return data;
  }

  @override
  String getSuspensionTag() => tag as String;
}
