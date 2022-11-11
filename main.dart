// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tourism/signup.dart';

void main(List<String> args) {
  runApp(My_app());
}

class My_app extends StatelessWidget {
  const My_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tourism"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.home)),
      ),
      body: FormBuilder(
        key: formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: "username",
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            FormBuilderTextField(
              name: "password",
              decoration: InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            Row(children: [
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,MaterialPageRoute(
                    //     builder: (context) => HomePage(Record: record)));
                  },
                  child: Text("Login")),
              SizedBox(
                width: 45,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: Text("Sign up"))
            ])
          ],
        ),
      ),
    );
  }
}
