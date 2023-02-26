import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('About'), backgroundColor: Colors.blue,),
      body: Text('This is a small Flutter mobile application made by TVT21SPO student Konsta Juola.'
             'In this mobile app you can read facts '
             'and see pictures about dogs. ',
      style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
             )
        )
    );
  }
}