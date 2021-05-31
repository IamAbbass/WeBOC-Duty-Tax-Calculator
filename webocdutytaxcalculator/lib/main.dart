import 'package:flutter/material.dart';
import 'calculator.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Tab> tabs = [
    Tab(text: "Item 1",),
    Tab(text: "Item 2",),
    Tab(text: "Item 3",),
    Tab(text: "Item 4",),
    Tab(text: "Item 5",),
    Tab(text: "Item 6",),
    Tab(text: "Item 7",),
    Tab(text: "Item 8",),
    Tab(text: "Item 9",),
    Tab(text: "Item 10",),    
    Tab(text: "Item 11",),

    Tab(text: "Item 12",),
    Tab(text: "Item 13",),
    Tab(text: "Item 14",),
    Tab(text: "Item 15",),
    Tab(text: "Item 16",),
    Tab(text: "Item 17",),
    Tab(text: "Item 18",),
    Tab(text: "Item 19",),
    Tab(text: "Item 20",),
    Tab(text: "Item 21",),
    Tab(text: "Item 22",),
    Tab(text: "Item 23",),
    Tab(text: "Item 24",),
    Tab(text: "Item 25",),
    Tab(text: "Item 26",),
  ];
  List<Widget> tabBarView = [
    calculator(tab: 1),
    calculator(tab: 2),
    calculator(tab: 3),
    calculator(tab: 4),
    calculator(tab: 5),
    calculator(tab: 6),
    calculator(tab: 7),
    calculator(tab: 8),
    calculator(tab: 9),
    calculator(tab: 10),
    calculator(tab: 11),
    calculator(tab: 12),
    calculator(tab: 13),
    calculator(tab: 14),
    calculator(tab: 15),
    calculator(tab: 16),
    calculator(tab: 17),
    calculator(tab: 18),
    calculator(tab: 19),
    calculator(tab: 20),
    calculator(tab: 21),
    calculator(tab: 22),
    calculator(tab: 23),
    calculator(tab: 24),
    calculator(tab: 25),
    calculator(tab: 26),
  ]; 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(            
            bottom: TabBar(
              indicatorColor: Colors.yellow,
              unselectedLabelColor: Colors.white,
              labelColor: Colors.yellow,
              isScrollable: true,
              tabs: tabs,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WeBOC Duty Tax Calculator'),
                SizedBox(height: 4,),
                GestureDetector(
                  child: Text('Hire us : 0316-1126671 | www.zeddevelopers.com', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.yellow),),
                  onTap: () async{
                    await canLaunch("https://www.zeddevelopers.com") ? await launch("https://www.zeddevelopers.com") : print("");
                  },
                )
              ],
            ),
          ),
          body: TabBarView(
            children: tabBarView,
          ),
        ),
      );
  }
}

