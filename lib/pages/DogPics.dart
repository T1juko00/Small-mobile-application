import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class DogPics extends StatefulWidget {
  const DogPics({super.key});

  @override
  State<DogPics> createState() => _DogPicsState();
}
class _DogPicsState extends State<DogPics> {

 dogPic dogpic = dogPic('https://images.dog.ceo/breeds/shiba/shiba-17.jpg', '');

  find() async {
    var url = Uri.parse('https://dog.ceo/api/breeds/image/random');
    var response = await get (url);
    var message = jsonDecode(response.body);
      setState(() {
        dogpic = dogPic.fromApi(message);
        });
  }

  @override
  Widget build(BuildContext context) {
   
   return Scaffold(appBar: AppBar(centerTitle: true, title: Text('Random dog pics'), backgroundColor: Colors.blue,),
    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              dogpic.message,
              width: double.infinity, // max width
              height: MediaQuery.of(context).size.height / 1.7,
              // height: 500, // alternative fixed height
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(5),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                onPressed: () {
                      find();
                },
                child: Text(
                  "Find a new image",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class dogPic {
  late String message;
  late String status;

  dogPic(this.message,this.status);
  dogPic.fromApi(api){
    message = api ['message'];
    status = api ['status'];
  }
}
