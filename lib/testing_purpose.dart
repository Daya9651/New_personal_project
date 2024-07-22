import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:likhit/const/image_strings.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<void> generateKotKitchenPdf({
   String invoiceDate = "544",
   String invoiceNo="154",
   String customerName="Satyam",
   String floor="gfg",
  // required List<ProductVariantModel> selectedProducts,
   List<int> ?quantities ,
  bool isKitchenBill = true,
  bool isA4Size = true,
}) async {
  // Calculate total quantity and total amount
  int totalQty = 0;
  double totalAmount = 0;

  // for (int i = 0; i < selectedProducts.length; i++) {
  //   totalQty += quantities[i];
  //   totalAmount += double.tryParse(
  //       (selectedProducts[i].sellingPrice ?? '') * quantities[i]) ??
  //       0.0;
  // }

  final fontData = await rootBundle.load('assets/fonts/Roboto-Black.ttf');
  final ttf = pw.Font.ttf(fontData);
  String? storeQr = "";
  // String? storeQr = profileStoreController.profile.value?.upiCode;

  if (storeQr != null && !storeQr.startsWith('http')) {
    storeQr = 'https://$storeQr';
  }

  pw.MemoryImage? image;
  try {
    final imageBytes = await http.get(Uri.parse(storeQr!));
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

  constRowData(name, value) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text('  $name', style: pw.TextStyle(font: ttf, fontSize: 10)),
        pw.Text('$value  ', style: pw.TextStyle(font: ttf, fontSize: 10)),
      ],
    );
  }

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
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Expanded(
            flex: 1,
            child: pw.Text(
              'S.no',
              maxLines: 1,
              softWrap: false,
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
          pw.Expanded(
            flex: 2,
            child: pw.Text(
              'Name',
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
              'Qty',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
          // pw.Expanded(
          //   flex: 1,
          //   child: pw.Text(
          //     'Rate',
          //     style: pw.TextStyle(
          //       fontWeight: pw.FontWeight.bold,
          //       fontSize: 10,
          //     ),
          //   ),
          // ),
          // pw.Expanded(
          //   flex: 1,
          //   child: pw.Text(
          //     'Disc',
          //     style: pw.TextStyle(
          //       fontWeight: pw.FontWeight.bold,
          //       fontSize: 10,
          //     ),
          //   ),
          // ),
          // pw.Expanded(
          //   flex: 1,
          //   child: pw.Text(
          //     'Amount',
          //     style: pw.TextStyle(
          //       fontWeight: pw.FontWeight.bold,
          //       fontSize: 10,
          //     ),
          //   ),
          // ),
        ],
      ),
    ),
  );

  // for (int index = 0; index < selectedProducts.length; index++) {
  //   final product = selectedProducts[index];
  //   final quantity = quantities[index];
  //
  //   productRows.add(
  //     pw.Container(
  //       padding: const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  //       child: pw.Row(
  //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //         children: [
  //           pw.Expanded(
  //             flex: 1,
  //             child: pw.Text(
  //               '${index + 1}',
  //             ),
  //           ),
  //           pw.Expanded(
  //             flex: 2,
  //             child: pw.Text(
  //               product.variantName.toString().toUpperCase(),
  //             ),
  //           ),
  //           pw.Expanded(
  //             flex: 1,
  //             child: pw.Text(
  //               '$quantity',
  //             ),
  //           ),
  //           // pw.Expanded(
  //           //   flex: 1,
  //           //   child: pw.Text(
  //           //     '${product.sellingPrice}',
  //           //   ),
  //           // ),
  //           // pw.Expanded(
  //           //   flex: 1,
  //           //   child: pw.Text(
  //           //     product.discount ?? "0",
  //           //   ),
  //           // ),
  //           // pw.Expanded(
  //           //   flex: 1,
  //           //   child: pw.Text(
  //           //     ((product.sellingPrice ?? '') * quantity),
  //           //   ),
  //           // ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  const PdfPageFormat pageFormat = PdfPageFormat(
      110.0 * PdfPageFormat.mm, 210.0 * PdfPageFormat.mm,
      marginAll: 0.5);
  pdf.addPage(
    pw.MultiPage(
      // pageFormat: pageFormat,
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(
            level: 0,
            child: pw.Center(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(

                        "",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      font: ttf,
                    ),
                  ),


                  constText('KOT', fontSize: 15),
                  constText('Floor & Table No: $floor'),
                ],
              ),
            ),
          ),
          constText('Customer Mobile: $customerName'),
          constText('KOT No: $invoiceNo'),
          // constText('KOT Date : ${formatDateString(invoiceDate)}'??DateTime.now()),
             pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: productRows,
          ),
          pw.SizedBox(height: 10),
          constPrintDivider(),
          // constRowData("Total Qty:", totalQty),
          // constRowData("Total Amount:", totalAmount.toStringAsFixed(2)),
          // constPrintDivider(),
          // pw.Row(
          //   mainAxisAlignment: pw.MainAxisAlignment.end,
          //   children: [
          //     pw.Text(
          //       'Total(INR) : ${totalAmount.toStringAsFixed(2)}',
          //       style: pw.TextStyle(
          //         fontWeight: pw.FontWeight.bold,
          //         font: ttf,
          //         fontSize: 14,
          //       ),
          //       textAlign: pw.TextAlign.center,
          //     ),
          //   ],
          // ),
          pw.SizedBox(height: 20),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              constText('Thank you for your visit!'),
              constText('Please come again!'),
              pw.SizedBox(height: 20),
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
  // final pdfFile = File(path);
  // await pdfFile.readAsBytes();
  // Write the new PDF file
  await file.writeAsBytes(await pdf.save());
  // Open the PDF for printing
  final pdfFile = File(path);
  await Printing.layoutPdf(onLayout: (_) => pdfFile.readAsBytes());
}
