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

// nav bar
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                  AssetImage("assets/images/icon_homebook.png")),
              iconSize: 22.0,
              color: Colors.black,
            ),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const ImageIcon(AssetImage("assets/images/icon_heart.png")),
              iconSize: 22.0,
              color: Colors.black,
            ),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon:
                  const ImageIcon(AssetImage("assets/images/icon_profile.png")),
              iconSize: 22.0,
              color: Colors.black,
            ),
            label: 'Course',
          ),
        ],
      ),

// end of nav bar

      body: Column(children: [
        // ignore: prefer_const_constructors

        // Courses Card data
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
      ]),

      // bottomNavigationBar: NavigationBar(destinations: [

      // ],

      // ),
    );
  }
}
