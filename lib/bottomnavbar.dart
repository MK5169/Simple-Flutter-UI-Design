import 'package:cryptoworld/grid_view.dart';
import 'package:cryptoworld/homepage.dart';
import 'package:cryptoworld/list_view.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  //BottomNavBar({required Key key}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: TabBar(
          indicatorColor: Colors.transparent,
          indicator: BoxDecoration(
              color: Colors.white30, borderRadius: BorderRadius.circular(25)),
          controller: _tabController,
          tabs: [Icon(Icons.home), Icon(Icons.list), Icon(Icons.grid_4x4)],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          ListViewPage(),
          GridViewPage(),
        ],
      ),
    );
  }
}
