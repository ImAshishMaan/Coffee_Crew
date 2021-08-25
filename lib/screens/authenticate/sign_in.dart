import 'package:firebase_login_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  final Function? toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to brew crew"),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed: () {
              widget.toggleView!();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val!.isEmpty ? "Enter an email" : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                validator: (val) =>
                    val!.length < 6 ? "Enter password longer than 6 " : null,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result =
                        await _auth.signWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() => error = "Wrong Credentials");
                    }
                  }
                },
              ),
              SizedBox(height: 20),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
