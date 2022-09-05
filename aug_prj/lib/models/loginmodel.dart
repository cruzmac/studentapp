class LogIn {
  int? userid;
  String? emailid;
  String? password;

  LogIn({this.userid, this.emailid, this.password});

  LogIn.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    emailid = json['emailid'];
    password = json['password'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['emailid'] = emailid;
    data['password'] = password;
    return data;
  }
}
