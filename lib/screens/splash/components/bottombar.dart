import 'package:flutter/material.dart';
import 'package:likhit/screens/bottombar/contracts.dart';
import 'package:likhit/screens/bottombar/homepage.dart';
import 'package:likhit/screens/bottombar/inbox.dart';
import 'package:likhit/screens/bottombar/profile.dart';

class MyBottomBar extends StatefulWidget {
  final String userName;

  const MyBottomBar({super.key,
    required this.userName});
  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int index = 0;
  final screen = [
    const HomePage(),
    const Contracts(),
    const Inbox(),
    ProfileInputPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
          ),
            child: Text("+", style: TextStyle(fontSize: 40,),)),),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text("Hey, Sachin"),
            SizedBox(width: 110,),
            InkWell(onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> MyTabBar()));
            },
              child: Container(
                  height: 40,
                  width: 135,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("Lawyer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
                  (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return const TextStyle(
                      color: Colors.indigo, fontWeight: FontWeight.bold);
                }
                return const TextStyle(color: Colors.grey);
              },
            ),
            indicatorColor: Colors.transparent),
        child: NavigationBar(
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(seconds: 1),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_filled),
              label: "Home",
              selectedIcon: Icon(
                Icons.home_filled,
                color: Colors.indigo,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.chat),
              label: "Contracts",
              selectedIcon: Icon(Icons.chat, color: Colors.indigo),
            ),
            NavigationDestination(
              icon: Icon(Icons.inbox),
              label: "Inbox",
              selectedIcon: Icon(Icons.inbox, color: Colors.indigo),
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile",
              selectedIcon: Icon(Icons.person, color: Colors.indigo),
            ),
          ],
        ),
      ),
      body: screen[index],
    );
  }
}