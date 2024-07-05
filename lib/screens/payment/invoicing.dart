import 'package:flutter/material.dart';

class Invoicing extends StatelessWidget {
  const Invoicing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Payment & Invoicing",
          style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            width: 370,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text('Naina Gupta',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('paid on 02/10/23', style: TextStyle(fontSize: 15,),),
                      ],
                    ),
                  ),
                  SizedBox(width: 140,),
                  Icon(Icons.currency_rupee),
                  Center(child: Text('25000.00',style: TextStyle(fontSize: 18),))
                ],

              ),
            ),
          ),
          SizedBox(height: 2,),
          Container(
            height: 80,
            width: 370,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text('Manoj Menda',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('paid on 02/11/23', style: TextStyle(fontSize: 15,),),
                      ],
                    ),
                  ),
                  SizedBox(width: 140,),
                  Icon(Icons.currency_rupee),
                  Center(child: Text('28000.00',style: TextStyle(fontSize: 18),))
                ],

              ),
            ),
          ),
          SizedBox(height: 2,),
          Container(
            height: 80,
            width: 370,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text('Naina Gupta',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('paid on 02/10/23', style: TextStyle(fontSize: 15,),),
                      ],
                    ),
                  ),
                  SizedBox(width: 140,),
                  Icon(Icons.currency_rupee),
                  Center(child: Text('25000.00',style: TextStyle(fontSize: 18),))
                ],

              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: InkWell(onTap: (){},
              child: Container(
                height: 40, width: 370,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                      child: Text("Create New Invoice", style: TextStyle(color: Colors.white,
                          fontSize: 22, fontWeight: FontWeight.bold),))),
            ),
          )
        ],
      ),
    );
  }
}
