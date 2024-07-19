
import 'package:flutter/material.dart';
import 'package:likhit/screens/payment/payment_dropdown.dart';

import 'laywer Invoice/my_transactions_invoice.dart';

class PayLawyer extends StatelessWidget {
   PayLawyer({super.key});
  @override
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
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
                const SizedBox(width: 120,),
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
                  decoration: const InputDecoration(
                 hintText: '0.00',
                 border: OutlineInputBorder(
                   borderSide: BorderSide.none
                 ),
                   prefixIcon: Icon(Icons.currency_rupee),// Icon inside the TextField
                             ),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  const Text("What's this payment for?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Container(
                    width: 370,
                    height: 45,
                    child: TextFormField(
                      decoration: const InputDecoration(
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
                  const SizedBox(height: 20,),
                  const Text("Payment Method",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Container(
                    width: 370, height: 45,
                      child: ConstantDropdown(options: ['Credit Card', "Debit Card", "UPI"],
                        onChanged: (value) {  },)),
                  const SizedBox(height: 50,),
                  InkWell(onTap: (){
                    // Navigator.push(context,
                    //   MaterialPageRoute(builder: (context) => const MyTransactionsInvoice()),);
                  },
                    child: Container(height: 45, width: 370,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Center(child: Text("Pay Now",
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
