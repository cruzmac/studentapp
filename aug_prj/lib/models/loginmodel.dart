class LogIn {
  int? user_id;
  String? username;
  String? password;

  LogIn({this.user_id, this.username, this.password});

  LogIn.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    password = json['username'];
    password = json['password'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['user_id'] = user_id;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
