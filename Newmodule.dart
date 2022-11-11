import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_app/main.dart';
import 'package:my_app/readdata.dart';
import 'package:page_transition/page_transition.dart';

class Newform extends StatefulWidget {
  const Newform({super.key});

  @override
  State<Newform> createState() => _NewformState();
}

class _NewformState extends State<Newform> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewForm"),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              FormBuilderTextField(
                name: "Studentname",
                decoration: const InputDecoration(
                    labelText: ("Studentname"),
                    icon: Icon(Icons.supervised_user_circle_rounded)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Enter  required student name")
                ]),
              ),
              FormBuilderTextField(
                name: "Age",
                decoration: InputDecoration(
                    labelText: ("Age"), icon: Icon(Icons.animation_outlined)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "Enter age"),
                  FormBuilderValidators.numeric(
                      errorText: "enter numbers only"),
                  FormBuilderValidators.min(18,
                      errorText: "age should be above 18"),
                  FormBuilderValidators.max(60, errorText: "enter age below 60")
                ]),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    formKey.currentState!.save();
                    formKey.currentState!.validate();
                    Navigator.push(
                        context,
                        PageTransition(
                            child: FormPage(),
                            type: PageTransitionType.leftToRight,
                            duration: Duration(seconds: 3)));
                  },
                  child: Text("Submit")),
              Image(image: AssetImage('assest/cat.png')),
              Container(
                child: Image.asset('assest/cat.png'),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
