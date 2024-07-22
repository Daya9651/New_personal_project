import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:likhit/const/const_width.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/screens/payment/controller/payment_controller.dart';
import 'package:likhit/style/text_style.dart';
import 'package:printing/printing.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/widget/custom_app_bar.dart';
import '../../../helpers/string_to_date_function.dart';
import '../../../style/color.dart';

class RequestTransactionInvoice extends StatefulWidget {
  final int paymentId;
  const RequestTransactionInvoice({super.key, required this.paymentId});

  @override
  State<RequestTransactionInvoice> createState() => _InvoicingState();
}

class _InvoicingState extends State<RequestTransactionInvoice> {
  PaymentController controller = Get.put(PaymentController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getPaymentRequestInvoiceData(widget.paymentId);
  }
  Future<void> generateKotKitchenPdf({
    String invoiceDate = "1",
    String invoiceNo="1",
    String customerName="Daya Kumar",
    List<int> ?quantities ,
    bool isKitchenBill = true,
    bool isA4Size = true,
  }) async {
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
                'Status',
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
                '${controller.invoicePaymentRequestList.value.data?.lawyer?.servicesOffered}',
                maxLines: 1,
                softWrap: false,

              ),
            ),

            pw.Expanded(
              flex: 1,
              child: pw.Text(
                '${controller.invoicePaymentRequestList.value.data?.status}',
                maxLines: 1,
                softWrap: false,
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                '${controller.invoicePaymentRequestList.value.data?.paymentAmount}',
                maxLines: 1,
                softWrap: false,
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
                      constText('Lawyer Name: ${controller.invoicePaymentRequestList.value.data?.lawyer?.name}', fontSize: 15),
                      constText('City : ${controller.invoicePaymentRequestList.value.data?.lawyer?.city}'),
                      constText('State : ${controller.invoicePaymentRequestList.value.data?.lawyer?.state}'),
                      constText('Country : ${controller.invoicePaymentRequestList.value.data?.lawyer?.country}'),
                      constText('Mob No : ${controller.invoicePaymentRequestList.value.data?.lawyer?.mobile}'),
                      constText('Area : ${controller.invoicePaymentRequestList.value.data?.lawyer?.address}'),
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
                      constText('${controller.invoicePaymentRequestList.value.data?.paymentId}', fontSize: 12),
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
                      constText('Customer :  ${controller.invoicePaymentRequestList.value.data?.client?.name}', fontSize: 15),
                      constText('Area : ${controller.invoicePaymentRequestList.value.data?.client?.address}'),
                      constText('City : ${controller.invoicePaymentRequestList.value.data?.client?.city}'),
                      constText('Country : ${controller.invoicePaymentRequestList.value.data?.client?.country}'),
                      constText('State : ${controller.invoicePaymentRequestList.value.data?.client?.state}'),
                    ]
                ),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      constText('Invoice Date ', fontSize: 12),
                      constText('${controller.invoicePaymentRequestList.value.data?.createdDate}', fontSize: 9),
                      constText('Reference# : ', fontSize: 12),
                      constText('${controller.invoicePaymentRequestList.value.data?.paymentId}', fontSize: 9),
                    ]
                ),
              ],
            ),
            pw.Divider(),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: productRows,
            ),
            constPrintDivider(),
            pw.Container(
              child:pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Total Amount',
                      ),
                      pw.Text('${controller.invoicePaymentRequestList.value.data?.paymentAmount.toString()}',
                        // style: AppTextStyles.kSmall8SemiBoldTextStyle
                      ),
                    ],
                  ),
                ],
              ),
            ),
            constPrintDivider(),
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
    final String path = '$dir/Kot$invoiceNo.pdf';
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
          title: 'Invoices',
          actions: [
            IconButton(onPressed: ()async {
              await generateKotKitchenPdf();
              // Optionally, show a message or perform additional actions after PDF generation

            },
                icon: const Icon(Icons.download, color: AppColors.white,)
            )],
        ),
        body:Obx(()=>controller.isLoading.value?Shimmer.fromColors(
            baseColor: baseColor, highlightColor: highLightColor,
            child: loadSke()):
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(logo, width: 70,),
                        Text('LikhitDe...', style: AppTextStyles.kBody15SemiBoldTextStyle,),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Payment Invoice', style: AppTextStyles.kBody15SemiBoldTextStyle,),
                        Text('${controller.invoicePaymentRequestList.value.data?.paymentId}', style: AppTextStyles.kSmall10RegularTextStyle,)
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
                        Text('Lawyer Name : ${controller.invoicePaymentRequestList.value.data?.lawyer?.name.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                        Text('City : ${controller.invoicePaymentRequestList.value.data?.lawyer?.city.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                        Text('State : ${controller.invoicePaymentRequestList.value.data?.lawyer?.state.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                        Text('Country : ${controller.invoicePaymentRequestList.value.data?.lawyer?.country.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                         Text('Currency : INR', style: AppTextStyles.kSmall10RegularTextStyle,),
                        Text('Mob No : ${controller.invoicePaymentRequestList.value.data?.lawyer?.mobile.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                        Text('Area : ${controller.invoicePaymentRequestList.value.data?.lawyer?.address.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
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
                        Text('Bill To', style: AppTextStyles.kBody15SemiBoldTextStyle,),
                        Text('Customer : ${controller.invoicePaymentRequestList.value.data?.client?.name.toString()}',
                           style: AppTextStyles.kSmall10RegularTextStyle,),
                        Text('Area :${controller.invoicePaymentRequestList.value.data?.client?.address.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                        Text('City :${controller.invoicePaymentRequestList.value.data?.client?.city.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                        Text('State :${controller.invoicePaymentRequestList.value.data?.client?.state.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                        Text('Country :${controller.invoicePaymentRequestList.value.data?.client?.country.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Invoice Date :',style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                        Text(formatDateTime(DateTime.parse(controller.invoicePaymentRequestList.value.data?.createdDate.toString()??""))),
                        Text('Reference# :', style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                        Text('${controller.invoicePaymentRequestList.value.data?.paymentId.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,)
                      ],
                    )
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Service', style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                    Text('Status', style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                    Text('Total\nAmount', style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${controller.invoicePaymentRequestList.value.data?.lawyer?.servicesOffered.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                    Text('${controller.invoicePaymentRequestList.value.data?.status.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                    Text('${controller.invoicePaymentRequestList.value.data?.paymentAmount.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                  ],
                ),
                const Divider(),
                Column(
                  children: [
                    const Divider(color: Colors.black,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount', style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                        Text('${controller.invoicePaymentRequestList.value.data?.paymentAmount.toString()}', style: AppTextStyles.kSmall8SemiBoldTextStyle,),
                      ],
                    ),
                    const Divider(color: Colors.black,),
                  ],
                ).marginOnly(left: 160),
                const SizedBox(height: 25,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Terms and Conditions :',style: AppTextStyles.kBody15SemiBoldTextStyle,),
                    Text('Pay according to Terms and conditions.',style: AppTextStyles.kSmall10RegularTextStyle,),
                  ],
                ),
              ],
            ).paddingAll(w7)
          )
        ),
    );
  }
}


// Future<void> generatePdf ({
//   required InvoiceModel ,
//   required  state,
//   required city,
//   required country,
//   required phone,
//   required area,
// List<Lawyer>? items})async{
//   final pdf = pw.Document();
//
//   pw.Widget styledTableCell(text,
//       {fontSize = 10,
//         pw.FontWeight? fontWeight,
//         PdfColor? color,
//         pw.TextDecoration? decoration}) {
//     return pw.Container(
//         padding: const pw.EdgeInsets.symmetric(horizontal: 3, vertical: 3),
//         decoration: pw.BoxDecoration(
//           color: color, // Set background color here
//         ),
//         child: pw.Center(
//           child: pw.Text(
//             text,
//             style: pw.TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: fontWeight,
//                 decoration: decoration),
//           ),
//         ));
//   }
// }