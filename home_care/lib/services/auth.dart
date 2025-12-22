import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_care/models/user.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//create user obj based on firebase user
  User _userFormFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFormFirebaseUser);
  }

  //sign in anonymous
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFormFirebaseUser(user);
    } catch (e) {
      print("fail to log in !!");
      print(e);
      return null;
    }
  }

  //sign in email and password
  Future signInEmailPw(String email , String pw) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pw);
      FirebaseUser user = result.user;
      return _userFormFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  // register with email and password
  Future registerEmailPw(String email , String pw) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pw);
      FirebaseUser user = result.user;
      return _userFormFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
