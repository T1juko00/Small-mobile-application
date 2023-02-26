import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Messages") ),
      body: const Text("",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      ),
    
      
    );
  }
}