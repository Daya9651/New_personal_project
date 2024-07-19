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
  @override
  Widget build(BuildContext context) {
    debugPrint('Daya : ${controller.invoiceDirectList.value.data?[0].status}');
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          title: 'Invoices',
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

                    TextButton(onPressed: (){
                      // generatePdf(
                      //     state: controller.invoicePaymentRequestList.value.data?.lawyer?.state ?? "",
                      //     city: controller.invoicePaymentRequestList.value.data?.lawyer?.city ?? "",
                      //     country: controller.invoicePaymentRequestList.value.data?.lawyer?.country ?? "",
                      //     phone: controller.invoicePaymentRequestList.value.data?.lawyer?.mobile ?? "",
                      //     area: controller.invoicePaymentRequestList.value.data?.lawyer?.address ?? "", ,
                      //     // items: widget.items
                      // );
                    }, child: const Text('Download'))

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