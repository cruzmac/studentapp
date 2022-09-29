class LogIn {
  String? id;
  String? firstname;
  String? lastname;
  String? location;

  LogIn({this.id, this.firstname, this.lastname, this.location});

  LogIn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    location = json['location'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['location'] = location;
    return data;
  }
}
