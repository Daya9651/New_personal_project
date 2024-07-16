import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/screens/lawyer_screen/controller/lawyer_appointment_controller.dart';
import 'package:likhit/style/text_style.dart';

import '../lawyer_screen/screens/controllers/lawyer_appointment_controllers.dart';

class Invoicing extends GetView<LawyerAppointmentControllers> {
  const Invoicing({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('DayaCity : ${controller.invoice.value.data?.paymentNo.toString()}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: controller.invoice.value.data?.paymentNo.toString(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    InkWell(
                        onTap: (){
                          controller.    getInvoiceById();
                        },
                        child: Image.asset(logo, width: 70,)),
                    Text('LikhitDe', style: AppTextStyles.kBody15SemiBoldTextStyle,),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('City : ${controller.invoice.value.data?.client?.city.toString()}'),
                    Text('State : ${controller.invoice.value.data?.client?.state.toString()}'),
                    Text('Country : ${controller.invoice.value.data?.client?.country.toString()}'),
                    Text('Currency : ${controller.invoice.value.data?.service?.fee.toString()}'),
                    Text('Mob No : ${controller.invoice.value.data?.client?.mobile.toString()}'),
                    Text('Area : ${controller.invoice.value.data?.client?.address.toString()}'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Payment Invoice', style: AppTextStyles.kBody15SemiBoldTextStyle,),
                    const Text('order number')
                  ],
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bill To', style: AppTextStyles.kBody15SemiBoldTextStyle,),
                     Text('Lawyer :${controller.invoice.value.data?.lawyer?.name.toString()}'),
                     Text('Mobile : ${controller.invoice.value.data?.lawyer?.mobile.toString()}'),
                     Text('Area :${controller.invoice.value.data?.lawyer?.address.toString()}'),
                     Text('City :${controller.invoice.value.data?.lawyer?.city.toString()}'),
                     Text('State :${controller.invoice.value.data?.lawyer?.state.toString()}'),
                     Text('Country :${controller.invoice.value.data?.lawyer?.country.toString()}'),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Invoice Date :',),
                    // Text('${controller.invoice.value.data?.createdDate.toString()}'),
                    Text('Reference# :'),
                    Text('order_OTlGYdE61xJGRX')
                  ],
                )
              ],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Service'),
                ConstantContainer(
                  width: 80,
                  child: Column(
                    children: [
                      Text('Price'),
                      Divider(),
                      Text('Discount')
                    ],
                  ),
                ),
                Text('Status'),
                Text('Payment \nMethod'),
                Text('Total Amount'),
              ],
            ),
            const Divider(),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${controller.invoice.value.data?.lawyer?.servicesOffered.toString()}'),
                ConstantContainer(
                  width: 80,
                  child: Column(
                    children: [
                      Text('${controller.invoice.value.data?.paymentAmount.toString()}'),
                      const Divider(),
                      const Text('10%')
                    ],
                  ),
                ),
                Text('${controller.invoice.value.data?.status.toString()}'),
                Text('${controller.invoice.value.data?.paymentMethod.toString()}'),
                Text('${controller.invoice.value.data?.likhitDeNetAmt.toString()}'),
              ],
            ),
            const Divider(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${controller.invoice.value.data?.paymentAmount.toString()}'),
                    Text('${controller.invoice.value.data?.paymentAmount.toString()}')
                  ],
                ),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Discount'),
                    Text('200.00')
                  ],
                ),
                const Divider(color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Price After Discount'),
                    Text('${controller.invoice.value.data?.payableAmountToLawyerAfterCharge.toString()}')
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('GST Tax'),
                    Text('${controller.invoice.value.data?.likhitGstAmt.toString()}')
                  ],
                ),
                const Divider(color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Total Amount'),
                    Text('${controller.invoice.value.data?.paymentAmount.toString()}')
                  ],
                ),
                const Divider(color: Colors.black,),
              ]
            ).marginOnly(left: 150),
            const SizedBox(height: 1,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Terms and Conditions :',style: AppTextStyles.kBody15SemiBoldTextStyle,),
                Text('Pay according to Terms and conditions.',style: AppTextStyles.kBody15RegularTextStyle,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// // import 'package:flutter/services.dart' show Uint8List;
//
// import '../../common/widget/const_container.dart';
// import '../../common/widget/custom_app_bar.dart';
// import '../../const/image_strings.dart';
// import '../../style/text_style.dart';
//
// class Invoicing extends StatefulWidget {
//   const Invoicing({Key? key}) : super(key: key);
//
//   @override
//   _InvoicingState createState() => _InvoicingState();
// }
//
// class _InvoicingState extends State<Invoicing> {
//   final pdf = pw.Document();
//
//   Future<void> _generateInvoiceAndDownload() async {
//     // Load logo image from assets
//     final Uint8List logo = (await rootBundle.load('logo'))
//         .buffer
//         .asUint8List();
//
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Image(pw.MemoryImage(logo), width: 70),
//                   pw.Text('LikhitDe',
//                       style: pw.TextStyle(
//                         fontSize: 15,
//                         fontWeight: pw.FontWeight.bold,
//                       )),
//                 ],
//               ),
//               pw.SizedBox(height: 10),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       pw.Text('City : Lucknow'),
//                       pw.Text('State : Uttar Pradesh'),
//                       pw.Text('Country : India'),
//                       pw.Text('Currency : INR'),
//                       pw.Text('Mob No : 1234567890'),
//                       pw.Text('Area : Indra Nagar'),
//                     ],
//                   ),
//                   pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.end,
//                     children: [
//                       pw.Text('Payment Invoice',
//                           style: pw.TextStyle(
//                             fontSize: 15,
//                             fontWeight: pw.FontWeight.bold,
//                           )),
//                       pw.Text('order number'),
//                     ],
//                   ),
//                 ],
//               ),
//               pw.Divider(),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       pw.Text('Bill To',
//                           style: pw.TextStyle(
//                             fontSize: 15,
//                             fontWeight: pw.FontWeight.bold,
//                           )),
//                       pw.Text('Lawyer :'),
//                       pw.Text('Mobile :'),
//                       pw.Text('Area :'),
//                       pw.Text('City :'),
//                       pw.Text('State :'),
//                       pw.Text('Country :'),
//                     ],
//                   ),
//                   pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       pw.Text('Invoice Date :'),
//                       pw.Text('02-07-2024 :: 05:49:56'),
//                       pw.Text('Reference# :'),
//                       pw.Text('order_OTlGYdE61xJGRX'),
//                     ],
//                   ),
//                 ],
//               ),
//               pw.Divider(),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text('Service'),
//                   pw.Container(
//                     width: 80,
//                     child: pw.Column(
//                       children: [
//                         pw.Text('Price'),
//                         pw.Divider(),
//                         pw.Text('Discount'),
//                       ],
//                     ),
//                   ),
//                   pw.Text('Status'),
//                   pw.Text('Payment \nMethod'),
//                   pw.Text('Total Amount'),
//                 ],
//               ),
//               pw.Divider(),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text('Premimum Card'),
//                   pw.Container(
//                     width: 80,
//                     child: pw.Column(
//                       children: [
//                         pw.Text('2000.00'),
//                         pw.Divider(),
//                         pw.Text('10%'),
//                       ],
//                     ),
//                   ),
//                   pw.Text('Unpaid  '),
//                   pw.Text('Net_banking'),
//                   pw.Text('2124.00'),
//                 ],
//               ),
//               pw.Divider(),
//               pw.Column(
//                 children: [
//                   pw.Row(
//                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: pw.CrossAxisAlignment.end,
//                     children: [
//                       pw.Text('Plane Price'),
//                       pw.Text('2000.00'),
//                     ],
//                   ),
//                   pw.Divider(),
//                   pw.Row(
//                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: pw.CrossAxisAlignment.end,
//                     children: [
//                       pw.Text('Discount'),
//                       pw.Text('200.00'),
//                     ],
//                   ),
//                   pw.Divider(color: PdfColors.black),
//                   pw.Row(
//                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: pw.CrossAxisAlignment.end,
//                     children: [
//                       pw.Text('Price After Discount'),
//                       pw.Text('1800.00'),
//                     ],
//                   ),
//                   pw.Divider(),
//                   pw.Row(
//                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: pw.CrossAxisAlignment.end,
//                     children: [
//                       pw.Text('GST Tax'),
//                       pw.Text('360.00'),
//                     ],
//                   ),
//                   pw.Divider(color: PdfColors.black),
//                   pw.Row(
//                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: pw.CrossAxisAlignment.end,
//                     children: [
//                       pw.Text('Total Amount'),
//                       pw.Text('2124'),
//                     ],
//                   ),
//                   pw.Divider(color: PdfColors.black),
//                 ],
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Terms and Conditions :',
//                   style: pw.TextStyle(
//                     fontSize: 15,
//                     fontWeight: pw.FontWeight.bold,
//                   )),
//               pw.Text(
//                 'Pay according to Terms and conditions.',
//               ),
//             ],
//           );
//         },
//       ),
//     );
//
//     // Save the PDF to a file
//     final output = await getTemporaryDirectory();
//     final file = File('${output.path}/invoice.pdf');
//     await file.writeAsBytes(await pdf.save());
//
//     // Show a snackbar to indicate successful PDF generation
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('PDF Generated and Saved')),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(
//         title: 'Invoices',
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Image.asset('logo', width: 70),
//                     Text(
//                       'LikhitDe',
//                       style: AppTextStyles.kBody15SemiBoldTextStyle,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('City : Lucknow'),
//                     Text('State : Uttar Pradesh'),
//                     Text('Country : India'),
//                     Text('Currency : INR'),
//                     Text('Mob No : 1234567890'),
//                     Text('Area : Indra Nagar'),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(
//                       'Payment Invoice',
//                       style: AppTextStyles.kBody15SemiBoldTextStyle,
//                     ),
//                     const Text('order number'),
//                   ],
//                 )
//               ],
//             ),
//             const Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Bill To',
//                       style: AppTextStyles.kBody15SemiBoldTextStyle,
//                     ),
//                     const Text('Lawyer :'),
//                     const Text('Mobile :'),
//                     const Text('Area :'),
//                     const Text('City :'),
//                     const Text('State :'),
//                     const Text('Country :'),
//                   ],
//                 ),
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Invoice Date :'),
//                     Text('02-07-2024 :: 05:49:56'),
//                     Text('Reference# :'),
//                     Text('order_OTlGYdE61xJGRX'),
//                   ],
//                 )
//               ],
//             ),
//             const Divider(),
//              Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Service'),
//                 ConstantContainer(
//                   width: 80,
//                   child: Column(
//                     children: [
//                       Text('Price'),
//                       Divider(),
//                       Text('Discount'),
//                     ],
//                   ),
//                 ),
//                 Text('Status'),
//                 Text('Payment \nMethod'),
//                 Text('Total Amount'),
//               ],
//             ),
//             const Divider(),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Premimum Card'),
//                 ConstantContainer(
//                   width: 80,
//                   child: Column(
//                     children: [
//                       Text('2000.00'),
//                       Divider(),
//                       Text('10%'),
//                     ],
//                   ),
//                 ),
//                 Text('Unpaid  '),
//                 Text('Net_banking'),
//                 Text('2124.00'),
//               ],
//             ),
//             const Divider(),
//              Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text('Plane Price'),
//                     Text('2000.00'),
//                   ],
//                 ),
//                 Divider(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text('Discount'),
//                     Text('200.00'),
//                   ],
//                 ),
//                 Divider(color: Colors.black),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text('Price After Discount'),
//                     Text('1800.00'),
//                   ],
//                 ),
//                 Divider(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text('GST Tax'),
//                     Text('360.00'),
//                   ],
//                 ),
//                 Divider(color: Colors.black),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text('Total Amount'),
//                     Text('2124'),
//                   ],
//                 ),
//                 Divider(color: Colors.black),
//               ],
//             ).marginOnly(left: 150),
//             const SizedBox(height: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Terms and Conditions :',
//                   style: AppTextStyles.kBody15SemiBoldTextStyle,
//                 ),
//                 // Text(
//                 //   'Pay according to Terms and conditions.',
//                 //   style: AppTextStyles.kBody15RegularTextStyle,
//                 // ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _generateInvoiceAndDownload,
//                 child: Text('Generate & Download PDF'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }