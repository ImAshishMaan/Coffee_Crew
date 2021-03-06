import 'package:firebase_login_flutter/models/brew.dart';
import 'package:firebase_login_flutter/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Coffee>?>(context);
    //print(brew.document)
    // brews.forEach((brew) {
    //   print(brew.name);
    //   print(brew.sugars);
    //   print(brew.strength);
    // });

    return ListView.builder(
      itemCount: brews?.length ?? 0,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews![index]);
      },
    );
  }
}
