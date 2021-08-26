import 'package:firebase_login_flutter/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final Brew? brew;

  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[(brew!.strength)!.toInt()],
          ),
          title: Text((brew!.name).toString()),
          subtitle: Text('Takes ${brew!.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
