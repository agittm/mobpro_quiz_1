import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobpro_quiz_1/pages/edit_profile.dart';
import 'package:mobpro_quiz_1/pages/profile.dart';

main(List<String> args) {
  runApp(MyApp());
}

dynamic profileName = "Agit TM";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Profile(profileName));
  }
}
