import 'package:azlistview/azlistview.dart';

class Attendance extends ISuspensionBean {
  String? std_name;
  String? roll_no;
  late bool? ispresent;
  String? tag;

  Attendance(
      { this.std_name,
       this.roll_no,
       this.ispresent,
       this.tag});

  Attendance.fromJson(Map<String, dynamic> json) {
    std_name = json['id'];
    roll_no = json['firstname'];
    ispresent = json['lastname'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = std_name;
    data['firstname'] = roll_no;
    data['lastname'] = ispresent;
    return data;
  }

  @override
  String getSuspensionTag() => tag as String;
}
