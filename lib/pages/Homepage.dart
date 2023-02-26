import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Future <void> _launchURL(String url) async {
    final Uri uri = Uri(scheme:"https", host: url);
    if(!await launchUrl(
      uri,
      mode:LaunchMode.externalApplication,
    )){
      throw "can not launch url";
    };

  }

  static final space = SizedBox(
    height: 15,
  );

  static final space1 = SizedBox(
    height: 8,
  );
  
  static final otsikko = Container(
    padding: const EdgeInsets.all(10),
    child: const Text('Some facts about dogs',
    style:  TextStyle(
      decoration: TextDecoration.underline,
      fontFamily: 'Times New Roman',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: 23,
    ))
    );

   static const teksti = Text('1. Their sense of smell is at least 40x better than ours:'
   'The area of cells in the brain that detect different smells'
  'is around 40 times larger in dogs than humans. This means that'
   'your dog can pick up on way more smells than we ever could.'
  'This is why dogs are often used to sniff out people, drugs and even money!',
    style:  TextStyle(
      fontFamily: 'Times New Roman',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    )
    );

  static const teksti1 = Text('2. Some have such good noses they can sniff out medical problems'
  'Yup, medical detection dogs are a thing. Because their sense of'
  'smell is so great, some dogs can be trained to sniff out medical'
   'conditions. They are used to diagnose a particular condition or '
   'to alert their owners if they need more medication. Some are even being trained to sniff out Covid-19!',
    style: TextStyle(
      fontFamily: 'Times New Roman',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      fontSize: 16
    ));
    static const teksti2 = Text('3. If you have a dog, you might notice that their ears move around a lot.'
     'They actually have around 18 muscles responsible for moving their ears.'
     'These help them to change the direction of their ears slightly to hear'
      'noises around them better, and play a really big part in telling us how'
      'our dogs are feeling. A lot of a dogs body language is expressed through'
      'what their ears are doing so a dogs ears are vital in helping them'
      'communicate both with us and other dogs.',
      style: TextStyle(
      fontFamily: 'Times New Roman',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      fontSize: 16
    ));

   @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(centerTitle: true, title:const  Text('Homepage'), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
          child:
       Column(
    children: [space,otsikko,teksti,space1,teksti1,space1,teksti2,],
      )
    )
    );
  }
}
  



