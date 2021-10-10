import 'dart:ui';
// import 'package:cryptoworld/appdrawer.dart';
import 'package:cryptoworld/serviceapi.dart';
import 'package:flutter/material.dart';
import 'package:cryptoworld/data';
// import 'package:http/http.dart';

var indexClicked = 0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShowData> userData;
  TextEditingController _keyController = new TextEditingController();

  // TextEditingController _emailController = new TextEditingController();
  // TextEditingController _userController = new TextEditingController();

  int pageCount = 0;
  int searchPageCount = 0;
  int apiPage = 1;
  int searchPage = 1;
  bool isPreviousPressed;
  bool isNextPressed;
  bool ifSearched = false;

  List<ShowData> searchResult = [];
  bool searchisPressed;

  @override
  void initState() {
    // isPreviousPressed = true;

    getPageLength();
    super.initState();
  }

  @override
  void dispose() {
    _keyController.dispose();
    super.dispose();
  }

  // Future<List<ShowData>> getUsers() async {
  //   // Future.delayed(Duration(seconds: 5), await listOfUser());
  //   // setState(() {
  //   //   userData = userList.reversed.toList();
  //   // });
  //   List<ShowData> uesrList = await searchListUsers();

  //   return uesrList;
  // }

  void getPageLength() async {
    String pageValue = await getFullListSize();
    print(pageValue);
    int temp = int.parse(pageValue);
    if (temp >= 1) {
      setState(() {
        pageCount = temp ~/ 5;
      });
    }
    print(pageCount);
  }

  void getSearchCount() async {
    String keywordsize = _keyController.text;
    String seachValue = await getSearchListSize(keywordsize);
    double searchTemp = double.parse(seachValue);
    if (searchTemp >= 1) {
      setState(() {
        searchPageCount = searchTemp / 5 as int;
      });
    }
  }

  // void getLength() async {
  //   String incCount = _pageNoController.text;
  //   int totalClicks;
  //   int val;
  //   int pgCount = await getFullListSize();
  //   totalClicks = (pgCount / val) as int;
  //   int pageNo = pgCount;
  //   incCount = pageNo.toString();
  //   setState(() {
  //     if (isNextPressed) {
  //       pageNo++;
  //       setState(() {
  //         incCount = pageNo.toString();
  //       });
  //       return incCount;
  //     } else if (isPreviousPressed) {
  //       pageNo--;
  //       setState(() {
  //         incCount = pageNo.toString();
  //       });
  //       return incCount;
  //     }
  //     if (pgCount / totalClicks != 0) {
  //       isNextPressed = false;
  //     }
  //   });
  // }

  // void getSearchLength() async {
  //   if (pCount == 0) {
  //     int pCount = await getFullListSize();
  //     pCount++;
  //   }
  // }

  // Future<List<ShowData>> searchUsers() async {
  //   String keywordcon = _keyController.text;
  //   print("Search conunt");
  //   print(searchPageCount);
  //   List<ShowData> searchUlist = await searchListUsers(keywordcon, searchPage);
  //   // setState(() {
  //   //   searchResult = searchUlist;
  //   // });
  //   print("count12");
  //   return searchUlist;
  // }

  // void _incrementCounter() {

  // }

  // Future<List<ShowData>> listUsers() async {
  //   // String pgadd = _pageNoController.text;
  //   List<ShowData> fullUlist = await fullListUsers();
  //   // setState(() {
  //   //   searchResult = fullUlist;
  //   // });
  //   //   print("count21");
  //   //   return fullUlist;
  // }

  @override
  Widget build(BuildContext context) {
    String keywordcon = _keyController.text;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("HomePage"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: new Container(
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey),
                child: new TextField(
                  controller: _keyController,
                  style: TextStyle(color: Colors.white),
                  decoration: new InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white),
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 14, 20, 0),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  onSubmitted: (ClickedOS) {
                    print(ClickedOS);

                    getSearchCount();
                    setState(() {
                      ifSearched = true;
                      // searchUsers();
                    });

                    print("pressed search");
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // getPageLength();
                        // pageCount--;
                        // apiPage = pageCount;
                        if (ifSearched) {
                          if (1 < searchPage) {
                            searchPage--;
                          }
                        } else {
                          if (1 < apiPage) {
                            apiPage--;
                          }
                        }
                      });

                      // setState(() {
                      //   isPreviousPressed = !isPreviousPressed;
                      // });
                      print("object1");
                    },
                    child: Container(
                      width: 110,
                      height: 50,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: 1 < searchPage || 1 < apiPage
                              ? Colors.blueGrey
                              : null),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Previous",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // if (isNextPressed == false) {
                      //   return null;
                      // } else {
                      setState(() {
                        // getPageLength();
                        if (ifSearched) {
                          if (searchPage < searchPageCount) {
                            searchPage++;
                          }
                        } else {
                          if (apiPage < pageCount) {
                            apiPage++;
                          }
                        }
                      });
                      // }
                      // getLength();
                      // isNextPressed = !isNextPressed;
                      print("object2");
                    },
                    child: Container(
                      width: 110,
                      height: 50,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // ),
                          color: ifSearched
                              ? searchPage < searchPageCount
                                  ? Colors.blueGrey
                                  : Colors.transparent
                              : apiPage < pageCount
                                  ? Colors.blueGrey
                                  : Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Next",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder(
                future: ifSearched
                    ? searchListUsers(_keyController.text, searchPage)
                    : fullListUsers(apiPage),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(semanticsLabel: "Loading");
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data == null) {
                    return Text("No Such Users.");
                  } else if (snapshot.hasError) {
                    return Text("Server Error Occured");
                  } else {
                    return listView(snapshot);
                  }
                },
              ),
              // : FutureBuilder(
              //     future: getUsers(),
              //     builder: (BuildContext context, AsyncSnapshot snapshot) {
              //       if (snapshot.connectionState ==
              //           ConnectionState.waiting) {
              //         return CircularProgressIndicator(
              //             semanticsLabel: "Loading");
              //       } else if (snapshot.connectionState ==
              //               ConnectionState.done &&
              //           snapshot.data == null) {
              //         return Text("No Such Users.");
              //       } else if (snapshot.hasError) {
              //         return Text("Server Error Occured");
              //       } else {
              //         return listView(snapshot);
              //       }
              //     },
              //   ),
            ),
          ],
        ),
      ),
    );
  }

  Column listView(AsyncSnapshot<dynamic> snapshot) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: Colors.black,
              width: 200,
              height: 200,
              child: Text(
                "UserName",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Container(
              color: Colors.black,
              width: 200,
              height: 200,
              child: Text(
                "FirstName",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Container(
              color: Colors.black,
              width: 200,
              height: 200,
              child: Text(
                "Email ID",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          itemCount: snapshot.data.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Container(
                  color: Colors.yellow,
                  width: 200,
                  height: 200,
                  child: Text(snapshot.data[index].firstName),
                ),
                SizedBox(
                  width: 2,
                ),
                Container(
                  color: Colors.yellow,
                  width: 200,
                  height: 200,
                  child: Text(snapshot.data[index].username),
                ),
                SizedBox(
                  width: 2,
                ),
                Container(
                  color: Colors.yellow,
                  width: 200,
                  height: 200,
                  child: Text(snapshot.data[index].email),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

 // final pages = [
  //   Center(
  //     child: Text('Account'),
  //   ),
  //   Center(
  //     child: Text('Shares'),
  //   ),
  //   Center(
  //     child: Text('Your Holdings'),
  //   ),
  //   Center(
  //     child: Text('Statistics'),
  //   ),
  //   Center(
  //     child: Text('Settings'),
  //   ),
  // ];
// body: pages[indexClicked],
      // drawer: Column(
      // / children: [
      // drawer: BackdropFilter(
      //   filter: new ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      //   child: AppDrawrer(),
      // ),
      // Container(
      //   color: Colors.black,
      // ),
      // drawer: AppDrawrer(),
      //  ],
      //),
 // TextButton(
            //   onPressed: () {
            //     // setState(() {
            //     //   searchisPressed = !searchisPressed;
            //     // });
            //     print("pressed");
            //     searchUsers();
            //   },
            //    GestureDetector(
            //      onTap: (){

            //        //   searchisPressed = !searchisPressed;
            // //     // });
            // //     print("pressed");
            // //     searchUsers();
            //      },
            //      child: Container(
            //       width: 200,
            //       height: 30,
            //       decoration: new BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         gradient: new LinearGradient(
            //           colors: [Colors.pinkAccent.shade100, Colors.green],
            //           begin: FractionalOffset.centerLeft,
            //           end: FractionalOffset.centerRight,
            //         ),
            //       ),
            //       child: Text(
            //         "search",
            //         style: TextStyle(color: Colors.black),
            //         textAlign: TextAlign.center,
            //       ),
            //                  ),
            //    ),
