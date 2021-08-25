import 'package:firebase_login_flutter/models/userclass.dart';
import 'package:firebase_login_flutter/screens/authenticate/authenticate.dart';
import 'package:firebase_login_flutter/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userclass?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }

    //* return either Home or authenticate widget
  }
}
