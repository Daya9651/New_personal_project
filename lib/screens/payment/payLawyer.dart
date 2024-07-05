
import 'package:flutter/material.dart';
import 'package:likhit/screens/payment/invoicing.dart';
import 'package:likhit/screens/payment/payment_dropdown.dart';

class PayLawyer extends StatelessWidget {
   PayLawyer({super.key});

  @override
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 70,),
            Text("Pay Laywer",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 120,),
              SizedBox(
                width: 200,
                child: TextFormField(
                  validator: (value) {
                    // Validate the input value
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                 hintText: '0.00',
                 border: OutlineInputBorder(
                   borderSide: BorderSide.none
                 ),
                   prefixIcon: Icon(Icons.currency_rupee),// Icon inside the TextField
                             ),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                ),
              ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("What's this payment for?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Container(
                    width: 370,
                    height: 45,
                    child: TextFormField(
                      decoration: InputDecoration(
                        // labelText: 'Enter your text',
                        border: OutlineInputBorder(
                        ),
                        labelStyle: TextStyle(fontSize: 20.0), // Adjust the font size of the label
                      ),
                      validator: (value) {
                        // Validate the input value
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      }),
                  ),
                  SizedBox(height: 20,),
                  Text("Payment Method",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Container(
                    width: 370, height: 45,
                      child: ConstantDropdown(options: ['Credit Card', "Debit Card", "UPI"],
                        onChanged: (value) {  },)),
                  SizedBox(height: 50,),
                  InkWell(onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Invoicing()),);
                  },
                    child: Container(height: 45, width: 370,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text("Pay Now",
                          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),))),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
