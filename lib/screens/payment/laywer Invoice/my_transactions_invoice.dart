import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:likhit/const/const_width.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/screens/payment/controller/payment_controller.dart';
import 'package:likhit/style/text_style.dart';
import 'package:printing/printing.dart';
import '../../../common/widget/custom_app_bar.dart';
import '../../../style/color.dart';

class MyTransactionsInvoice extends StatefulWidget {
  final int paymentId;
   const MyTransactionsInvoice({super.key, required this.paymentId});

  @override
  State<MyTransactionsInvoice> createState() => _InvoicingState();
}

class _InvoicingState extends State<MyTransactionsInvoice> {
  PaymentController controller = Get.put(PaymentController());
  // @override
  // void initState() {
  //   super.initState();
  //   controller.getMyTransactionLawyerInvoice(widget.paymentId);
  // }

  Future<void> generateKotKitchenPdf() async {
    final fontData = await rootBundle.load('assets/fonts/Roboto-Black.ttf');
    final ttf = pw.Font.ttf(fontData);
    String? storeQr = "";
    // String? storeQr = profileStoreController.profile.value?.upiCode;

    if (!storeQr.startsWith('http')) {
      storeQr = 'https://$storeQr';
    }

    pw.MemoryImage? image;
    try {
      final imageBytes = await http.get(Uri.parse(storeQr));
      image = pw.MemoryImage(
        imageBytes.bodyBytes,
      );
    } catch (e) {
      // Use asset image as fallback
      final placeholderImageData = await rootBundle.load(logo);
      image = pw.MemoryImage(
        placeholderImageData.buffer.asUint8List(),
      );
    }
    final pdf = pw.Document();
    List<pw.Widget> productRows = [];
    constText(name, {double? fontSize}) {
      return pw.Text(
        '$name',
        style: pw.TextStyle(
          font: ttf,
          fontSize: fontSize ?? 10,
        ),
      );
    }
    constPrintDivider() {
      return pw.Divider(color: PdfColors.black, thickness: 0.03);
    }

    productRows.add(
      pw.Container(
        decoration: const pw.BoxDecoration(
          border: pw.Border(
            bottom: pw.BorderSide(color: PdfColors.black),
          ),
        ),
        padding: const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
          children: [
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                'Service',
                maxLines: 1,
                softWrap: false,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                'Lawyer\nAmount',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                'LikhitDe\nAmount',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                'Payment\nMethod',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                'Total\nAmount',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    productRows.add(
      pw.Center(child:pw.Container(
        padding: const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 5,),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
          children:  [
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                '${controller.getMyTransactionLawyerInvoiceList.value.data}',
                maxLines: 1,
                softWrap: false,

              ),
            ),

            pw.Expanded(
              flex: 1,
              child: pw.Text(
                "${controller.getMyTransactionLawyerInvoiceList.value.data}",
                maxLines: 1,
                softWrap: false,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                '${controller.getMyTransactionLawyerInvoiceList.value.data?.totalPayableAmount}',
                maxLines: 1,
                softWrap: false,
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                '${controller.getMyTransactionLawyerInvoiceList.value.data?.paymentNo}',
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                '${controller.getMyTransactionLawyerInvoiceList.value.data?.totalPayableAmount}',
              ),
            ),
          ],
        ),
      ),
      ),
    );

    pw.Divider();
    pdf.addPage(
      pw.MultiPage(
        // pageFormat: pageFormat,
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "LikhitDe",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          font: ttf,
                        ),
                      ),
                      constText('Lawyer Name: ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.name}', fontSize: 15),
                      constText('City : ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.city}'),
                      constText('State : ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.state}'),
                      constText('Country : ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.country}'),
                      constText('Mob No : ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.mobile}'),
                      constText('Area : ${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.address}'),
                    ]
                ),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Payment Invoice",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          font: ttf,
                        ),
                      ),
                      constText('${controller.getMyTransactionLawyerInvoiceList.value.data?.paymentNo}', fontSize: 12),
                    ]
                ),
              ],
            ),
            pw.Divider(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Bill To",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          font: ttf,
                        ),
                      ),
                      constText('Customer :  ${controller.invoiceList.value.data?.client?.name}', fontSize: 15),
                      constText('Area : ${controller.invoiceList.value.data?.client?.address}'),
                      constText('City : ${controller.invoiceList.value.data?.client?.city}'),
                      constText('Country : ${controller.invoiceList.value.data?.client?.country}'),
                      constText('State : ${controller.invoiceList.value.data?.client?.state}'),
                    ]
                ),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      constText('Invoice Date ', fontSize: 12),
                      constText('${controller.invoiceList.value.data?.createdDate}', fontSize: 9),
                      constText('Reference# : ', fontSize: 12),
                      constText('${controller.invoiceList.value.data?.paymentNo}', fontSize: 9),
                    ]
                ),
              ],
            ),
            pw.Divider(),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: productRows,
            ),
            pw.SizedBox(height: 10),
            constPrintDivider(),
            pw.Container(
              margin: const pw.EdgeInsets.only(left: 140),
              child:pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Split GST',
                      ),
                      pw.Text('${controller.invoiceList.value.data?.splitGstAmt?.toStringAsFixed(2)}')
                    ],
                  ),
                  pw.Divider(),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'LikhitDe GST',
                      ),
                      pw.Text('${controller.invoiceList.value.data?.likhitGstAmt}')
                    ],
                  ),
                  pw.Divider(
                    // color: Colors.black,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('Gateway Charge'),
                      pw.Text('${controller.invoiceList.value.data?.getwayAmt.toString()}'),
                    ],
                  ),
                  pw.Divider(),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'LikhitDe Payable Amount',
                        // style: AppTextStyles.kSmall8SemiBoldTextStyle,
                      ),
                      pw.Text(((controller.invoiceList.value.data?.likhitDeNetAmt ?? 0) * 10 / 100).toString()),
                    ],
                  ),
                  pw.Divider(
                    // color: Colors.black,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Lawyer Payable Amount',
                        // style: AppTextStyles.kSmall8SemiBoldTextStyle,
                      ),
                      pw.Text('${controller.invoiceList.value.data?.paymentAmount.toString()}'),
                    ],
                  ),
                  pw.Divider(
                    // color: Colors.black,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Total Amount',
                        // style: pw.AppTextStyles.kSmall8SemiBoldTextStyle,
                      ),
                      pw.Text('${controller.invoiceList.value.data?.paymentAmount.toString()}',
                        // style: AppTextStyles.kSmall8SemiBoldTextStyle
                      ),
                    ],
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Text('Terms and Conditions', style: pw.TextStyle(
                  fontSize: 26,
                  fontWeight: pw.FontWeight.bold,
                  font: ttf,
                ),),
                pw.Text('Pay according  to Terms and conditions.', style: const pw.TextStyle(
                  fontSize: 20,
                ),),
              ],
            ),
          ];
        },
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/Kot.pdf';
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
    await file.writeAsBytes(await pdf.save());
    await file.writeAsBytes(await pdf.save());
    final pdfFile = File(path);
    await Printing.layoutPdf(onLayout: (_) => pdfFile.readAsBytes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Invoices.....Daya',
        actions: [
          IconButton(onPressed: ()async {
            await generateKotKitchenPdf();
            // Optionally, show a message or perform additional actions after PDF generation
          },
              icon: const Icon(Icons.download, color: AppColors.white,)
          )],
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
                    Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.paymentNo.toString()}')
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
                        controller.getMyTransactionLawyerInvoiceList.value.data?.createdDate
                            .toString() ??
                            ""),
                    // Text(formatDateTime(DateTime.parse(
                    //     controller.invoiceList.value.data?.client!.createdDate
                    //         .toString() ??
                    //         ""))),
                    const Text('Reference# :'),
                    Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.paymentNo.toString()??""}')
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
                Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.lawyer?.servicesOffered.toString()}'),
                Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.totalPayableAmount.toString()}'),
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
                    Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.totalPayableAmount}')
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Gateway Charge'),
                    Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.totalPayableAmount.toString()}'),
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
                    Text('${controller.getMyTransactionLawyerInvoiceList.value.data?.totalPayableAmount.toString()}',
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

















