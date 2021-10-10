import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  // GridView({Key key}) : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage>
    with SingleTickerProviderStateMixin {
  final List<String> coins = <String>['BITCOIN', 'ETHEREUM', 'DOGECOIN'];
  final List<String> coin = <String>['BTC', 'ETH', 'DOGE'];
  final List<String> price = <String>['2600000', '200000', '29'];
  final List<String> imgs = <String>[
    'assets/images/bitcoin-btc-logo.png',
    'assets/images/eth.png',
    'assets/images/doge.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("GridViewPage"),
      ),
      body: GridView.builder(
        itemCount: imgs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 200,
            crossAxisCount: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3),
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              color: Colors.grey,
              child: Image.asset(
                '${imgs[index]}',
                height: 81,
                width: 81,
                // fit: BoxFit.cover,
              ), //('${coins[index]}'),
            ),
            Container(
              child: Text('${coins[index]}'),
            ),
            Container(
              child: Text('${coin[index]}'),
            ),
            Container(
              child: Text('${price[index]}'),
            ),
          ],
        ),
      ),
    );
  }
}








// body: GridView.count(
//         crossAxisCount: 2,
//         childAspectRatio: 1.0,
//         padding: const EdgeInsets.all(6.0),
//         mainAxisSpacing: 5.0,
//         crossAxisSpacing: 5.0,
//         children: [
//           Column(
//             children: [
//               Container(
//                 child: Image.asset(
//                   "assets/images/bitcoin-btc-logo.png",
//                   height: 50,
//                   width: 50,
//                   //fit: Boxfi,
//                 ),
//               ),
//               Text(
//                 "Bitcoin",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               Text("BTC"),
//               Text("Price - 2600000")
//             ],
//           ),
//           Column(
//             children: [
//               Container(
//                 child: Image.asset(
//                   "assets/images/eth.png",
//                   height: 50,
//                   width: 50,
//                 ),
//               ),
//               Text(
//                 "Ethereum",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               Text("ETH"),
//               Text("Price - 200000"),
//             ],
//           ),
//           Column(
//             children: [
//               Container(
//                 child: Image.asset(
//                   "assets/images/doge.png",
//                   height: 50,
//                   width: 50,
//                 ),
//               ),
//               Text("Dogecoin",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//               Text("Doge"),
//               Text("Price - 29")
//             ],
//           ),
//         ],
//       ),

//  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         children: <Widget>[
//           Container(child :Image.asset("assets/images/bitcoin-btc-logo.png",height: 50,width: 50,),),