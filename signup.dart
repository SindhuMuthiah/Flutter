import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tourism"),
      ),
      body: FormBuilder(
        child: Column(children: [
          FormBuilderTextField(name: "Name"),
          FormBuilderTextField(name: "mail-id"),
          FormBuilderTextField(name: "age"),
          FormBuilderTextField(name: "password"),
        ]),
      ),
    );
  }
}
