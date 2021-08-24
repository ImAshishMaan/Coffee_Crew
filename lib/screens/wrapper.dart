import 'package:firebase_login_flutter/screens/authenticate/authenticate.dart';
import 'package:firebase_login_flutter/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* return either Home or authenticate widget
    return Authenticate();
  }
}
