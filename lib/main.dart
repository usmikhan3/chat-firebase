// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app_new/models/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:chat_app_new/models/user_model.dart';
import 'package:chat_app_new/pages/complete_profile.dart';
import 'package:chat_app_new/pages/home_screen.dart';
import 'package:chat_app_new/pages/login_screen.dart';
import 'package:chat_app_new/pages/sign_up_screen.dart';
import 'package:uuid/uuid.dart';

import 'firebase_options.dart';

var uuid = Uuid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  User? currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser != null) {
    UserModel? thisUserModel =
        await FirebaseHelper.getUserModelById(currentUser.uid);
    if (thisUserModel != null) {
      runApp(MyAppLoggedIn(
        firebaseUser: currentUser,
        userModel: thisUserModel,
      ));
    } else {
      runApp(const MyApp());
    }
  } else {
    runApp(const MyApp());
  }
}

//NotLogged In

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHAT APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

//Logged In

class MyAppLoggedIn extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;
  const MyAppLoggedIn({
    Key? key,
    required this.userModel,
    required this.firebaseUser,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHAT APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(
        firebaseUser: firebaseUser,
        userModel: userModel,
      ),
    );
  }
}
