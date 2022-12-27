class UserModel {
  String? uid;
  String? fullname;
  String? email;
  String? profilePic;

  UserModel({this.uid, this.fullname, this.email, this.profilePic});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    fullname = map["fullname"];
    email = map["email"];
    profilePic = map["profilePic"];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullname": fullname,
      "email": email,
      "profilePic": profilePic,
    };
  }
}
