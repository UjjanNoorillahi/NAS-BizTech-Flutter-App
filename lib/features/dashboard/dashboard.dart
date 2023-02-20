import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Column(children: [
          // ignore: prefer_const_constructors

          // Courses Card data
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      height: 150,
                      width: 150,
                      margin: const EdgeInsets.all(10),
                      color: Colors.amber,
                      child: Center(child: Text(index.toString())),
                    ),
                  ),
                )
              ],
            ),
          ),

// teacher's Card data
          // ignore: prefer_const_constructors
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(10),
                      color: Colors.amber,
                      child: Center(child: Text(index.toString())),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
