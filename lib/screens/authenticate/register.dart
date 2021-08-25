import 'package:firebase_login_flutter/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function? toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

final AuthService _auth = AuthService();

// text field state
String email = "";
String password = "";

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("SignUp in to brew crew"),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text("SignIn"),
            onPressed: () {
              widget.toggleView!();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text(
                  "Rregister",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
