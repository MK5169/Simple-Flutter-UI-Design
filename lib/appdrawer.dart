import 'package:cryptoworld/draw.dart';
// import 'package:cryptoworld/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var indexClicked = 0;

class AppDrawrer extends StatefulWidget {
  // AppDrawrer(BuildContext context, {required Key key}) : super(key: key);

  @override
  _AppDrawrerState createState() => _AppDrawrerState();
}

class _AppDrawrerState extends State<AppDrawrer> {
  final pages = [
    Center(
      child: Text('Account'),
    ),
    Center(
      child: Text('Shares'),
    ),
    Center(
      child: Text('Your Holdings'),
    ),
    Center(
      child: Text('Statistics'),
    ),
    Center(
      child: Text('Settings'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/bgdraw.jpg'),
              ),
            ),
            padding: EdgeInsets.all(0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/eth.png'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Person',
                      style: GoogleFonts.sanchez(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'person@gmail.com',
                      style: GoogleFonts.sanchez(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      indexClicked = 0;
                    });
                    Navigator.pop(context);
                  },
                  selected: indexClicked == 0,
                  selectedTileColor: Defaults.drawerSelectedTileColor,
                  leading: Icon(
                    Defaults.drawerItemIcon[0],
                    size: 30,
                    color: indexClicked == 0
                        ? Defaults.drawerItemSelectedColor
                        : Defaults.drawerItemColor,
                  ),
                  title: Text(
                    Defaults.drawerItemText[0],
                    style: GoogleFonts.sanchez(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: indexClicked == 0
                          ? Defaults.drawerItemSelectedColor
                          : Defaults.drawerItemColor,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      indexClicked = 1;
                    });
                    Navigator.pop(context);
                  },
                  selected: indexClicked == 1,
                  selectedTileColor: Defaults.drawerSelectedTileColor,
                  leading: Icon(
                    Defaults.drawerItemIcon[1],
                    size: 30,
                    color: indexClicked == 1
                        ? Defaults.drawerItemSelectedColor
                        : Defaults.drawerItemColor,
                  ),
                  title: Text(
                    Defaults.drawerItemText[1],
                    style: GoogleFonts.sanchez(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: indexClicked == 1
                          ? Defaults.drawerItemSelectedColor
                          : Defaults.drawerItemColor,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      indexClicked = 2;
                    });
                    Navigator.pop(context);
                  },
                  selected: indexClicked == 2,
                  selectedTileColor: Defaults.drawerSelectedTileColor,
                  leading: Icon(
                    Defaults.drawerItemIcon[2],
                    size: 30,
                    color: indexClicked == 2
                        ? Defaults.drawerItemSelectedColor
                        : Defaults.drawerItemColor,
                  ),
                  title: Text(
                    Defaults.drawerItemText[2],
                    style: GoogleFonts.sanchez(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: indexClicked == 2
                          ? Defaults.drawerItemSelectedColor
                          : Defaults.drawerItemColor,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      indexClicked = 3;
                    });
                    Navigator.pop(context);
                  },
                  selected: indexClicked == 3,
                  selectedTileColor: Defaults.drawerSelectedTileColor,
                  leading: Icon(
                    Defaults.drawerItemIcon[3],
                    size: 30,
                    color: indexClicked == 3
                        ? Defaults.drawerItemSelectedColor
                        : Defaults.drawerItemColor,
                  ),
                  title: Text(
                    Defaults.drawerItemText[3],
                    style: GoogleFonts.sanchez(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: indexClicked == 3
                          ? Defaults.drawerItemSelectedColor
                          : Defaults.drawerItemColor,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      indexClicked = 4;
                    });
                    Navigator.pop(context);
                  },
                  selected: indexClicked == 4,
                  selectedTileColor: Defaults.drawerSelectedTileColor,
                  leading: Icon(
                    Defaults.drawerItemIcon[4],
                    size: 30,
                    color: indexClicked == 4
                        ? Defaults.drawerItemSelectedColor
                        : Defaults.drawerItemColor,
                  ),
                  title: Text(
                    Defaults.drawerItemText[4],
                    style: GoogleFonts.sanchez(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: indexClicked == 4
                          ? Defaults.drawerItemSelectedColor
                          : Defaults.drawerItemColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Defaults.drawerItemColor,
                  indent: 30,
                  endIndent: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Crypto World',
                    style: GoogleFonts.sanchez(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      color: Defaults.drawerItemSelectedColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    'Version 1.0',
                    style: GoogleFonts.sanchez(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Defaults.drawerItemColor,
                  indent: 30,
                  endIndent: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
