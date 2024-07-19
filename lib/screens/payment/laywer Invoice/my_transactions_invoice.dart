import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:likhit/const/const_width.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/screens/payment/controller/payment_controller.dart';
import 'package:likhit/style/text_style.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/widget/custom_app_bar.dart';
import '../../../helpers/string_to_date_function.dart';
import '../../../style/color.dart';

class MyTransactionsInvoice extends StatefulWidget {
  final int paymentId;
   const MyTransactionsInvoice({super.key, required this.paymentId});

  @override
  State<MyTransactionsInvoice> createState() => _InvoicingState();
}

class _InvoicingState extends State<MyTransactionsInvoice> {
  PaymentController controller = Get.put(PaymentController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getMyTransactionLawyerInvoice(widget.paymentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Invoices',
      ),
      body:
      Obx(()
      =>
        // controller.isLoading.value
      //     ? Shimmer.fromColors(
      //   baseColor: baseColor,
      //   highlightColor: highLightColor,
      //   child: loadSke(),
      // ):
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      logo,
                      width: w60,
                    ),
                    Text(
                      'LikhitDe',
                      style: AppTextStyles.kBody15SemiBoldTextStyle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Payment Invoice',
                      style: AppTextStyles.kBody15SemiBoldTextStyle,
                    ),
                    Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.paymentId.toString()}')
                  ],
                ).marginOnly(top: 60),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'City : ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.city.toString()}'),
                    Text(
                        'State : ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.state.toString()}'),
                    Text(
                        'Country : ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.country.toString()}'),
                    const Text('Currency : INR'),
                    Text(
                        'Mob No : ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.mobile.toString()}'),
                    Text(
                        'Area : ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.address.toString()}'),
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    // await generateInvoicePdf(widget.paymentId);
                    // Optionally, show a message or perform additional actions after PDF generation

                  },
                  child: const Text('Download'),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bill To',
                      style: AppTextStyles.kBody15SemiBoldTextStyle,
                    ),
                    Text(
                        'Lawyer : ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.name.toString()}'),
                    // Text('Mobile :${controller.invoiceList.value.data?.client?.mobile.toString()}'),
                    Text(
                        'Area :${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.address.toString()}'),
                    Text(
                        'City :${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.city.toString()}'),
                    Text(
                        'State :${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.state.toString()}'),
                    Text(
                        'Country :${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.country.toString()}'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Invoice Date :',
                    ),
                    Text(
                        controller.getMyTransactionLawyerInvoiceList.value.data?.client?.createdDate
                            .toString() ??
                            ""),
                    // Text(formatDateTime(DateTime.parse(
                    //     controller.invoiceList.value.data?.client!.createdDate
                    //         .toString() ??
                    //         ""))),
                    const Text('Reference# :'),
                    Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.paymentId.toString()??""}')
                  ],
                )
              ],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Service'),
                // SizedBox(
                //   width: 112,
                //   child: Column(
                //     children: [
                //       Text('Lawyer Amount'),
                //       Divider(
                //         color: Colors.black,
                //       ),
                //       Text('LikhitDe Amount')
                //     ],
                //   ),
                // ),
                Text('Payment \nMethod'),
                Text('Total\nAmount'),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.servicesOffered ?? ""),
                // SizedBox(
                //   width: 70,
                //   child: Column(
                //     children: [
                //       Text(
                //           '${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.toString()}'),
                //       const Divider(
                //         color: Colors.black,
                //       ),
                //       Text(
                //           '${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?..toString()}')
                //     ],
                //   ),
                // ),
                Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.paymentFor.toString()}'),
                Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.paymentAmount.toString()}'),
              ],
            ),
            const Divider(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Split GST',
                    ),
                    Text('${controller.invoiceList.value.data?.splitGstAmt?.toStringAsFixed(2)}')
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'LikhitDe GST',
                    ),
                    Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.paymentAmount}')
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Gateway Charge'),
                    Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.paymentAmount.toString()}'),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LikhitDe Payable Amount',
                      style: AppTextStyles.kSmall8SemiBoldTextStyle,
                    ),
                    Text(((controller.invoiceList.value.data?.likhitDeNetAmt ?? 0) * 10 / 100).toString()),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lawyer Payable Amount',
                      style: AppTextStyles.kSmall8SemiBoldTextStyle,
                    ),
                    Text('${controller.invoiceList.value.data?.paymentAmount.toString()}'),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: AppTextStyles.kSmall8SemiBoldTextStyle,
                    ),
                    Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.paymentAmount.toString()}',
                        style: AppTextStyles.kSmall8SemiBoldTextStyle),
                  ],
                ),
              ],
            ).marginOnly(left: 130),
            const SizedBox(
              height: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terms and Conditions',
                  style: AppTextStyles.kBody15SemiBoldTextStyle,
                ),
                Text(
                  'Pay according to Terms and conditions.',
                  style: AppTextStyles.kSmall10RegularTextStyle,
                ),
              ],
            ),
          ],
        ).paddingAll(w7),
      ),
    // )
    ));
  }
}


//
//
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:likhit/const/image_strings.dart';
// import 'package:likhit/screens/payment/controller/payment_controller.dart';
// import 'package:likhit/style/text_style.dart';
// import 'package:likhit/common/widget/custom_app_bar.dart';
//
// class Invoicing extends StatelessWidget {
//   final PaymentController controller = Get.put(PaymentController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Printable Invoice'),
//       body:TextButton (onPressed: () {
//         (formate) => _generateInvoice;
//       }, child: Text('daya'),
//       ),
//     );
//   }
//
//   Future<Uint8List> _generateInvoice(PdfPageFormat format) async {
//     final pdf = pw.Document();
//
//     return pdf.save();
//   }
//   Future<pw.Widget> _buildHeader() async {
//     return pw.Row(
//         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//         children: [
//     pw.Column(
//     children: [
//     // pw.Image(PdfImage.file(
//     //     pdf.document,
//     //     bytes: await rootBundle.load(logo),
//     // ) as pw.ImageProvider),
//     pw.Text('LikhitDe', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//     ],
//     ),
//     pw.Column(
//     crossAxisAlignment: pw.CrossAxisAlignment.end,
//     children: [
//     pw.Text('Payment Invoice', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//     pw.Text('${controller.invoiceList.value.data?.paymentNo ?? ''}'),
//     ],
//     ),
//     ],
//     );
//   }
//
//   pw.Widget _buildClientInfo() {
//     return pw.Row(
//       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//       children: [
//         pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text('Bill To', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//             pw.Text('Lawyer : ${controller.invoiceList.value.data?.client?.name ?? ''}'),
//             pw.Text('Mobile : ${controller.invoiceList.value.data?.client?.mobile ?? ''}'),
//             pw.Text('Area : ${controller.invoiceList.value.data?.client?.address ?? ''}'),
//             pw.Text('City : ${controller.invoiceList.value.data?.client?.city ?? ''}'),
//             pw.Text('State : ${controller.invoiceList.value.data?.client?.state ?? ''}'),
//             pw.Text('Country : ${controller.invoiceList.value.data?.client?.country ?? ''}'),
//           ],
//         ),
//         pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text('Invoice Date :'),
//             pw.Text('${controller.invoiceList.value.data?.client?.createdDate ?? ''}'),
//             pw.Text('Reference# :'),
//             pw.Text('${controller.invoiceList.value.data?.paymentNo ?? ''}'),
//           ],
//         ),
//       ],
//     );
//   }
//
//   pw.Widget _buildInvoiceDetails() {
//     return pw.Row(
//       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//       children: [
//         pw.Text('Service', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//         pw.SizedBox(
//           width: 70,
//           child: pw.Column(
//             children: [
//               pw.Text('Price', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.Divider(),
//               pw.Text('Discount', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//             ],
//           ),
//         ),
//         pw.Text('Status', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//         pw.Text('Payment Method', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//         pw.Text('Total Amount', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//       ],
//     );
//   }
//
//   pw.Widget _buildPriceDetails() {
//     return pw.Row(
//       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//       children: [
//         pw.Text('${controller.invoiceList.value.data?.lawyer?.servicesOffered ?? ''}'),
//         pw.SizedBox(
//           width: 70,
//           child: pw.Column(
//             children: [
//               pw.Text('${controller.invoiceList.value.data?.paymentAmount ?? ''}'),
//               pw.Divider(),
//               pw.Text('10'),
//             ],
//           ),
//         ),
//         pw.Text('${controller.invoiceList.value.data?.status ?? ''}'),
//         pw.Text('${controller.invoiceList.value.data?.paymentMethod ?? ''}'),
//         pw.Text('${controller.invoiceList.value.data?.paymentAmount ?? ''}'),
//       ],
//     );
//   }
//
//   pw.Widget _buildTotalAmount() {
//     return pw.Column(
//       crossAxisAlignment: pw.CrossAxisAlignment.start,
//       children: [
//         pw.Row(
//           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//           children: [
//             pw.Text('Plane Price',),
//             pw.Text('${controller.invoiceList.value.data?.paymentAmount ?? ''}'),
//           ],
//         ),
//         pw.Divider(),
//         pw.Row(
//           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//           children: [
//             pw.Text('Discount'),
//             pw.Text('${((controller.invoiceList.value.data?.paymentAmount ?? 0) * 10 / 100).toString()}'),
//           ],
//         ),
//         pw.Divider(),
//         pw.Row(
//           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//           children: [
//             pw.Text('Price after discount', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//             pw.Text('${controller.invoiceList.value.data?.payableAmountToLawyerAfterCharge ?? ''}'),
//           ],
//         ),
//         pw.Divider(),
//         pw.Row(
//           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//           children: [
//             pw.Text('GST Tax', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//             pw.Text('${controller.invoiceList.value.data?.getwayGstAmt ?? ''}'),
//           ],
//         ),
//         pw.Divider(),
//         pw.Row(
//           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//           children: [
//             pw.Text('Total Amount', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//             pw.Text('${controller.invoiceList.value.data?.paymentAmount ?? ''}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//           ],
//         ),
//       ],
//     );
//   }
//
//   pw.Widget _buildTermsAndConditions() {
//     return pw.Column(
//       crossAxisAlignment: pw.CrossAxisAlignment.start,
//       children: [
//         pw.Text('Terms and Conditions', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//         pw.Text('Pay according to Terms and conditions.'),
//       ],
//     );
//   }
// }

















