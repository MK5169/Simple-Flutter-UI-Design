import 'package:carousel_slider/carousel_slider.dart';
import 'package:cryptoworld/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final List<String> coins = <String>['BITCOIN', 'ETHEREUM', 'DOGE'];
  final List<String> price = <String>['2600000', '200000', '29'];
  final List<String> imgs = <String>[
    'assets/images/btc.png',
    'assets/images/eth.png',
    'assets/images/doge.png'
  ];
  final List<String> imglist = <String>[
    'assets/images/cry1.jpg',
    'assets/images/cry2.jpg',
    'assets/images/cry3.jpg',
    'assets/images/cry4.jpg',
    'assets/images/cry6.jpg',
    'assets/images/cry7.jpg',
  ];

  List<Widget> itemData = crypto_details.cast<Widget>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Listview Page"),
        elevation: 10,
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black26),
              width: 40,
              height: 40,
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  //highlightColor: Colors.black,
                  color: Colors.black45,
                  // hoverColor: Colors.grey,
                  //splashRadius: 30,
                  // splashColor: Colors.green,
                  // focusColor: Colors.grey,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            new Container(
              // height: double.infinity,
              width: 280,
              margin: EdgeInsets.only(top: 20),
              //padding: EdgeInsets.all(210),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Change Password",
                    style: GoogleFonts.biryani(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 230,
                    // height: 40,
                    margin: EdgeInsets.all(20),
                    // padding: EdgeInsets.all(),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Form(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  // textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    hintText: 'New Password',
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  // textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    hintText: 'Confirm Password',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: size.width * 0.1,
                    height: size.height * 0.05,
                    decoration: new BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.98,
                  height: 280,
                  enlargeCenterPage: true,
                  // initialPage: 0,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                ),
                items: imglist
                    .map(
                      (e) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          child: Image.asset(
                            e,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                    .toList()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: coins.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                child: Image.asset(
                                  '${imgs[index]}',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Row(
                                    children: [
                                      Text('${coins[index]}'),
                                    ],
                                  )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          '${price[index]}',
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
          // Container(
          //   margin: EdgeInsets.only(top: 20),
          //
          // ),
        ],
      ),
    );
  }
}

//  ListView(
// children:(
//   CarouselSlider(
//       items: [

//         Container(
//           margin: EdgeInsets.all(6.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0),
//             image: DecorationImage(
//              image: NetworkImage("ADD IMAGE URL HERE"),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),

//         //2nd Image of Slider
//         Container(
//           margin: EdgeInsets.all(6.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0),
//             image: DecorationImage(
//               image: NetworkImage("ADD IMAGE URL HERE"),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),

//         //3rd Image of Slider
//         Container(
//           margin: EdgeInsets.all(6.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0),
//             image: DecorationImage(
//               image: NetworkImage("ADD IMAGE URL HERE"),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),

//         //4th Image of Slider
//         Container(
//           margin: EdgeInsets.all(6.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0),
//             image: DecorationImage(
//               image: NetworkImage("ADD IMAGE URL HERE"),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),

//         //5th Image of Slider
//         Container(
//           margin: EdgeInsets.all(6.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0),
//             image: DecorationImage(
//               image: NetworkImage("ADD IMAGE URL HERE"),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),

//   ],
// ),

//     //Slider Container properties
//       options: CarouselOptions(
//         height: 180.0,
//         enlargeCenterPage: true,
//         autoPlay: true,
//         aspectRatio: 16 / 9,
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enableInfiniteScroll: true,
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         viewportFraction: 0.8,
//       ),
//   ),
// ),// ],

// return Container(
//   height: 50,
//   color: Colors.blue[colorCodes[index]],
//   child: Center(child: Text('${entries[index]}'),
//   // Row -> Image ,column->text,text
//   )
// );

// child: Column(
//   crossAxisAlignment: CrossAxisAlignment.stretch,
//   children: [
//     DrawerHeader(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           fit: BoxFit.fill,
//           image: AssetImage('assets/images/rbg.jpg'),
//         ),
//       ),
//       padding: EdgeInsets.all(0),
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(0),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage('assets/images/pro.jpg'),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 'Info',
//                 style: GoogleFonts.sanchez(
//                     fontSize: 15, color: Colors.white),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     Expanded(
//       child: ListView(
//         padding: EdgeInsets.all(0),
//         children: [
//           ListTile(
//             onTap: () {},
//             leading: Icon(
//               Icons.money_rounded,
//               size: 30,
//             ),
//             title: Text(
//               'Deposit',
//               style: GoogleFonts.sanchez(
//                   fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//           ),
//           ListTile(
//             onTap: () {},
//             leading: Icon(
//               Icons.compare_arrows,
//               size: 30,
//             ),
//             title: Text(
//               'Transfer',
//               style: GoogleFonts.sanchez(
//                   fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//           ),
//           ListTile(
//             onTap: () {},
//             leading: Icon(
//               Icons.info,
//               size: 30,
//             ),
//             title: Text(
//               'About',
//               style: GoogleFonts.sanchez(
//                   fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Divider(
//             height: 1,
//             thickness: 1,
//             color: Colors.blueGrey,
//             indent: 30,
//             endIndent: 30,
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Center(
//             child: Text(
//               'Crypto World',
//               style: GoogleFonts.saira(
//                   fontSize: 15,
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Center(
//             child: Text(
//               'Version 2.0',
//               style: GoogleFonts.saira(
//                   fontSize: 11,
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.w400),
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Divider(
//             height: 1,
//             thickness: 1,
//             indent: 30,
//             endIndent: 30,
//             color: Colors.blueGrey,
//           )
//         ],
//       ),
//     )
//   ],
// ),
