import 'package:body_mind/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserAuth extends ChangeNotifier {
  UserAuth() {
    isLogged();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore firestore = Firestore.instance;

  UserData user;

  Future<void> signUp(
      {UserData userData, Function onFail, Function onSuccess}) async {
    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: userData.email, password: userData.password);

      userData.id = result.user.uid;

      await userData.saveInfo();
      onSuccess();
    } catch (e) {
      onFail('The error is: $e');
    }
  }

  Future<void> singIn(
      {UserData userData, Function onFail, Function onSuccess}) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: userData.email, password: userData.password);

      await isLogged(firebaseUser: result.user);
      onSuccess();
    } catch (e) {
      onFail('The error is: $e');
    }
  }

  Future<void> isLogged({FirebaseUser firebaseUser}) async {
    final FirebaseUser currentUser = firebaseUser ?? await auth.currentUser();
    if (currentUser != null) {
      final DocumentSnapshot documentUser =
          await firestore.collection('users').document(currentUser.uid).get();
      user = UserData.fromDocument(documentUser);
      notifyListeners();
    }
  }
}
