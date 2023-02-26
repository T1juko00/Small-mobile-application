import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages/About.dart';
import 'pages/Homepage.dart';
import './pages/DogPics.dart';
import './pages/profile.dart';
import './pages/Home.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _iconbool ? _darkTheme : _lightTheme,
      home: Menubar(),
    );
  }
}

class Menubar extends StatefulWidget {
  const Menubar({super.key});

  @override
  State<Menubar> createState() => _MenubarState();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _MenubarState extends State<Menubar> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "can not launch url";
    }
    ;
  }
  int currentPage= 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _iconbool ? _darkTheme : _lightTheme,
        home: Scaffold(
          appBar: AppBar(centerTitle: true, title: Text("Android"), actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _iconbool = !_iconbool;
                });
              },
              icon: Icon(_iconbool ? _iconDark : _iconLight),
            ),
          ]),
          drawer: Drawer(
              child: ListView(
            //drawer : menu, vetopalkki
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      //koriste
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/spaceimg.jpg"))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, //siirtää containerin vasempaan ylälaitaan
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Center(
                              child: Icon(Icons.favorite,
                                  size: 30, color: Colors.black))),
                      SizedBox(height: 5), //tekee tilaa kuvan ja tekstin väliin
                      Text(
                        'Menubar',
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                    ],
                  )),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                },
                leading: Icon(Icons.home, size: 25, color: Colors.black),
                title: Text('Homepage', style: TextStyle(fontSize: 15)),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DogPics()),
                  );
                },
                leading: Icon(Icons.pets, size: 25, color: Colors.black),
                title: Text('Dog pics', style: TextStyle(fontSize: 15)),
              ),
              Divider(color: Colors.black),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );
                },
                leading:
                    Icon(Icons.info_rounded, size: 25, color: Colors.black),
                title: Text('About', style: TextStyle(fontSize: 15)),
              ),
            ],
          )),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'images/world.jpg',
                  height: 700,
                  
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.youtube),
                      color: Colors.red,
                      iconSize: 60,
                      onPressed: () {
                        _launchURL("www.youtube.com");
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        _launchURL("www.instagram.com");
                      },
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      color: Color.fromARGB(255, 252, 204, 99),
                      iconSize: 60,
                    ),
                    IconButton(
                      onPressed: () {
                        _launchURL("www.google.com");
                      },
                      icon: FaIcon(FontAwesomeIcons.google),
                      iconSize: 50,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
          backgroundColor: Colors.black,
          bottomNavigationBar: NavigationBar(
            height: 65,
            destinations: const  [
              NavigationDestination(
                icon: Icon (Icons.phone),
                label: 'Call',
              ),
              NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.message),
                label: 'Messages',
              )
            ],
            onDestinationSelected: (int index ) {
              setState(() {
                currentPage = index;
                if (currentPage == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()));
                  }
                else if (currentPage == 0) {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()));
                }
              });
            },
            selectedIndex: currentPage, 
          ),
        ));
  }
}
