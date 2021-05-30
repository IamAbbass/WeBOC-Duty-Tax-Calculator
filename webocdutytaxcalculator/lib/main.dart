import 'package:flutter/material.dart';
import 'calculator.dart';

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
    Tab(icon: Icon(Icons.calculate_outlined), text: "Item 1",),
    Tab(icon: Icon(Icons.calculate_outlined), text: "Item 2",),
    Tab(icon: Icon(Icons.calculate_outlined), text: "Item 3",),
    Tab(icon: Icon(Icons.calculate_outlined), text: "Item 4",),
    Tab(icon: Icon(Icons.calculate_outlined), text: "Item 5",),
    Tab(icon: Icon(Icons.calculate_outlined), text: "Item 6",),
    Tab(icon: Icon(Icons.calculate_outlined), text: "Item 7",),
    Tab(icon: Icon(Icons.calculate_outlined), text: "Item 8",),
    Tab(icon: Icon(Icons.calculate_outlined), text: "Item 9",),
    Tab(icon: Icon(Icons.calculate_outlined), text: "Item 10",),    
    Tab(icon: Icon(Icons.calculate_outlined), text: "Item 11",),
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
    calculator(tab: 11)
  ]; 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: tabs,
            ),
            title: Text('WeBOC Duty Tax Calculator'),
          ),
          body: TabBarView(
            children: tabBarView,
          ),
        ),
      );
  }
}
