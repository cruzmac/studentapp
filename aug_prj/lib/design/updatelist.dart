import 'package:aug_prj/models/attendance_model.dart';

class UpdatedList {
  static final UpdatedList _singleton = UpdatedList._internal();
  List<Attendance> list =[];

  factory UpdatedList() {
    return _singleton;
  }
  UpdatedList._internal();
}
