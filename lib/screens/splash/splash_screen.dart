import 'package:flutter/material.dart';
import 'package:likhit/screens/splash/components/splash_componets.dart';
import 'package:likhit/screens/splash/components/bottombar.dart';

import '../../constants.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "",
      "image": "assets/logo/silder3.png"
    },
    {
      "text": " ",
      "image": "assets/logo/silder3.png"
    },
    {
      "text": " ",
      "image": "assets/logo/silder3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Image.asset('assets/logo/likhitlogo.png', height: 60, width: 60,), // Adjust the path to your image
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
            const SizedBox(width: 210,),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyBottomBar(userName: '',)));
            },
              child: Container(
                height: 30,
                width: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text("Skip"))),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children:[
              const SizedBox(height: 15,),
              Expanded(
                flex: 1,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      // const Spacer(),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                              (index) => AnimatedContainer(
                            duration: kAnimationDuration,
                            margin: const EdgeInsets.only(right: 1),
                            height: 1,
                            width: currentPage == index ? 20 : 6,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? kPrimaryColor
                                  : const Color(0xFFD8D8D8),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      // const Spacer(flex: 3),
                      const SizedBox(height: 10,),
                      const Center(child: Text("Streamlined", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)),
                      const SizedBox(height: 0.1,),
                      const Center(child: Text("Agreements", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),)),
                      const SizedBox(height: 5,),
                      const SizedBox(height: 10,),
                      const Center(
                          child: Text("     Welcome to Likhit De, where\n  aggrements are made simple and\n"
                              "                     efficient",
                            style: TextStyle(fontSize: 25),)),
                      const Spacer(flex: 3),
                      Row(
                        children: [
                          const SizedBox(width: 25,),
                          InkWell(onTap: (){
                            Navigator.pop(context);
                          },child: const Text("<", style: TextStyle(fontSize: 40),)),
                          const SizedBox(width: 200,),
                          Container(
                              height:60, width:120,
                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                borderRadius: BorderRadius.circular(30)
                              ),
                                  child: InkWell(onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyBottomBar(userName: 'Daya',)));
                                  },
                                      child: const Center(child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 20),)))),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}