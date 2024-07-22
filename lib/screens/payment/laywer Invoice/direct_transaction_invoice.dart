import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/helpers/string_to_date_function.dart';
import 'package:likhit/screens/payment/controller/payment_controller.dart';
import 'package:likhit/style/color.dart';
import "package:http/http.dart" as http;
import 'package:likhit/style/text_style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:shimmer/shimmer.dart';
import '../../../const/const_width.dart';

class DirectTransactionInvoice extends StatefulWidget {
  final int ?paymentId;
  const DirectTransactionInvoice({super.key, this.paymentId});

  @override
  State<DirectTransactionInvoice> createState() => _InvoicingState();
}

class _InvoicingState extends State<DirectTransactionInvoice> {
  PaymentController controller = Get.put(PaymentController());

  @override
  void initState() {
    super.initState();
    controller.getInvoiceData(widget.paymentId);
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
                '${controller.invoiceList.value.data?.service?.title}',
                maxLines: 1,
                softWrap: false,

              ),
            ),

            pw.Expanded(
              flex: 1,
              child: pw.Text(
                "${controller.invoiceList.value.data?.paymentAmount}",
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
                '${controller.invoiceList.value.data?.likhitDeCommission}',
                maxLines: 1,
                softWrap: false,
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                '${controller.invoiceList.value.data?.paymentMethod}',
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                '${controller.invoiceList.value.data?.paymentAmount}',
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
                      constText('Lawyer Name: ${controller.invoiceList.value.data?.lawyer?.name}', fontSize: 15),
                      constText('City : ${controller.invoiceList.value.data?.lawyer?.city}'),
                      constText('State : ${controller.invoiceList.value.data?.lawyer?.state}'),
                      constText('Country : ${controller.invoiceList.value.data?.lawyer?.country}'),
                      constText('Mob No : ${controller.invoiceList.value.data?.lawyer?.mobile}'),
                      constText('Area : ${controller.invoiceList.value.data?.lawyer?.address}'),
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
                      constText('${controller.invoiceList.value.data?.paymentNo}', fontSize: 12),
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
      body: Obx(() => controller.isLoading.value
          ? Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highLightColor,
        child: loadSke(),
      ): SingleChildScrollView(
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
                    Text('${controller.invoiceList.value.data?.paymentNo}')
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
                        'Lawyer Name : ${controller.invoiceList.value.data?.lawyer?.name.toString()}'),
                    Text(
                        'City : ${controller.invoiceList.value.data?.lawyer?.city.toString()}'),
                    Text(
                        'State : ${controller.invoiceList.value.data?.lawyer?.state.toString()}'),
                    Text(
                        'Country : ${controller.invoiceList.value.data?.lawyer?.country.toString()}'),
                    const Text('Currency : INR'),
                    Text(
                        'Mob No : ${controller.invoiceList.value.data?.lawyer?.mobile.toString()}'),
                    Text(
                        'Area : ${controller.invoiceList.value.data?.lawyer?.address.toString()}'),
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
                        'Customer : ${controller.invoiceList.value.data?.client?.name.toString()}'),
                    // Text('Mobile :${controller.invoiceList.value.data?.client?.mobile.toString()}'),
                    Text(
                        'Area :${controller.invoiceList.value.data?.client?.address.toString()}'),
                    Text(
                        'City :${controller.invoiceList.value.data?.client?.city.toString()}'),
                    Text(
                        'State :${controller.invoiceList.value.data?.client?.state.toString()}'),
                    Text(
                        'Country :${controller.invoiceList.value.data?.client?.country.toString()}'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Invoice Date :',
                    ),
                    Text(formatDateTime(DateTime.parse(
                        controller.invoiceList.value.data?.client!.createdDate
                            .toString() ??
                            ""))),
                    const Text('Reference# :'),
                    Text('${controller.invoiceList.value.data?.paymentNo.toString()}')
                  ],
                )
              ],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Service'),
                SizedBox(
                  width: 112,
                  child: Column(
                    children: [
                      Text('Lawyer Amount'),
                      Divider(
                        color: Colors.black,
                      ),
                      Text('LikhitDe Amount')
                    ],
                  ),
                ),
                Text('Payment \nMethod'),
                Text('Total\nAmount'),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(controller.invoiceList.value.data?.service?.title ?? ""),
                SizedBox(
                  width: 70,
                  child: Column(
                    children: [
                      Text(
                          '${controller.invoiceList.value.data?.paymentAmount.toString()}'),
                      const Divider(
                        color: Colors.black,
                      ),
                      Text(
                          '${controller.invoiceList.value.data?.likhitDeCommission.toString()}')
                    ],
                  ),
                ),
                Text('${controller.invoiceList.value.data?.paymentMethod.toString()}'),
                Text('${controller.invoiceList.value.data?.paymentAmount.toString()}'),
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
                    Text('${controller.invoiceList.value.data?.likhitGstAmt}')
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Gateway Charge'),
                    Text('${controller.invoiceList.value.data?.getwayAmt.toString()}'),
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
                    Text('${controller.invoiceList.value.data?.paymentAmount.toString()}',
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
      )),
    );
  }
}

