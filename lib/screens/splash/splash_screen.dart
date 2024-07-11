import 'package:flutter/material.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/screens/splash/components/splash_componets.dart';
import 'package:likhit/screens/splash/components/bottombar.dart';
import 'package:likhit/style/text_style.dart';

import '../../constants.dart';

class SplashScreen2 extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen2> {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset('assets/logo/likhitlogo.png', height: 60, width: 70,), // Adjust the path to your image
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
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
                  child:  Center(child: Text("Skip", style: AppTextStyles.kBody15SemiBoldTextStyle,))),
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
              // const SizedBox(height: 15,),
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
                      // const SizedBox(height: 10,),
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
                      const Spacer(flex: 1),

                      const Center(child: Text("Streamlined", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
                      const SizedBox(height: 0.1,),
                      const Center(child: Text("Agreements", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                      const Spacer(flex: 1),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text("Welcome to Likhit De, where aggrements are made simple and efficient",
                                  style: TextStyle(fontSize: 18),),
                          ),
                        ],
                      ),
                      const Spacer(flex: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(onTap: (){
                            Navigator.pop(context);
                          },child:  const ConstantContainer(
                            width: 110,
                              height: 40,
                              radiusBorder: 20,
                              color: Colors.grey,
                              child: Text("<", style: TextStyle(fontSize: 35),))),
                          Container(
                              height:40, width:110,
                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                borderRadius: BorderRadius.circular(30)
                              ),
                                  child: InkWell(onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyBottomBar(userName: 'Daya',)));
                                  },
                                      child: const Center(child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 15),)))),
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