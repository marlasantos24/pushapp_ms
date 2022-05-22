import 'package:flutter/material.dart';


class MensajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

final arg = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mensaje Page MS <3'),
      ),
      body: Center(
        child: Text(arg.toString()),
      ),
    );
  }
}