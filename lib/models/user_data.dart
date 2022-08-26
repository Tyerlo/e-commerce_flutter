import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  String uid;
  String email;

  UserData({required this.uid, required this.email});

  UserData.fromMap(Map<String, dynamic> map)
      : email = map["email"] ?? "",
        uid = map["uid"] ?? "";

  Map<String, dynamic> toMap() {
    return {"email": email, "uid": uid};
  }
}
