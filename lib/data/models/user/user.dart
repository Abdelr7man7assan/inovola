

class User {
  int? uid;
  String? name;
  String? image;
  String? email;
  String? password;

  User(
      {this.uid,
      this.name,
      this.image,
      this.password,
      this.email,});


  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    image = json['image'];
    password = json['user_password'];
    email = json['user_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['image'] = image;
    data['user_password'] = password;
    data['user_email'] = email;

    return data;
  }

  @override
  String toString() {
    return 'User{uid: $uid, name: $name image: $image, email: $email, password: $password}';
  }
}

