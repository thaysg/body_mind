import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String id;
  String name;
  String email;
  String password;

  UserData({this.id, this.name, this.email, this.password});

  UserData.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document.data['name'] as String;
    email = document.data['email'] as String;
  }

  DocumentReference get firestoreRef =>
      Firestore.instance.document('users/$id');

  Future<void> saveInfo() async {
    await firestoreRef.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
