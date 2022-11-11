import 'package:flutter/material.dart';

class SecondModule extends StatelessWidget {
  final Age;
  const SecondModule({super.key, this.Age});

  @override
  Widget build(BuildContext context) {
    print(this.Age);
    return Scaffold(
      body: Text("Second Module", style: TextStyle(fontSize: 50)),
    );
  }
}
