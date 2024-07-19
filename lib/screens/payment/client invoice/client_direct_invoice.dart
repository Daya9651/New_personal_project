import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/screens/payment/controller/payment_controller.dart';
import 'package:likhit/style/text_style.dart';
import 'package:likhit/style/color.dart';

class ClientDirectInvoice extends StatefulWidget {
  final int paymentId;

  const ClientDirectInvoice({super.key, required this.paymentId});

  @override
  _ClientDirectInvoiceState createState() => _ClientDirectInvoiceState();
}

class _ClientDirectInvoiceState extends State<ClientDirectInvoice> {
  final PaymentController controller = Get.put(PaymentController());

  Future<void> generateInvoicePdf(int paymentId) async {
    // Fetch invoice data using your controller
    await controller.invoiceList();

    // Create a new PDF document
    final pdf = pw.Document();

    // Add content to the PDF document
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              children: [
                pw.Text('Invoice Details',
                    style: pw.TextStyle(
                        fontSize: 20, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 20),
                pw.Text(
                    'Payment Number: ${controller.invoiceList.value.data?.paymentNo ?? ''}'),
                pw.Text(
                    'Lawyer Name: ${controller.invoiceList.value.data?.lawyer?.name ?? ''}'),
                pw.Text(
                    'Client Name: ${controller.invoiceList.value.data?.client?.name ?? ''}'),
                pw.Text(
                    'Total Amount: ${controller.invoiceList.value.data?.paymentAmount ?? ''}'),
                // Add more fields as needed
              ],
            ),
          );
        },
      ),
    );

    // Save the PDF to a file
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/invoice_$paymentId.pdf");
    await file.writeAsBytes(await pdf.save());

    // Show a snackbar after PDF generation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF Generated and saved.'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          title: 'Invoices',
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highLightColor,
            child: loadSke(),

                )
              : SingleChildScrollView(
                  padding: EdgeInsets.all(8.0),
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
                                width: 70,
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
                              Text(
                                '${controller.invoiceList.value.data?.paymentNo}',
                                style: AppTextStyles.kSmall10RegularTextStyle,
                              )
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
                                'Lawyer Name : ${controller.invoiceList.value.data?.lawyer?.name.toString()}',
                                style: AppTextStyles.kSmall10RegularTextStyle,
                              ),
                              Text(
                                'City : ${controller.invoiceList.value.data?.lawyer?.city.toString()}',
                                style: AppTextStyles.kSmall10RegularTextStyle,
                              ),
                              Text(
                                'State : ${controller.invoiceList.value.data?.lawyer?.state.toString()}',
                                style: AppTextStyles.kSmall10RegularTextStyle,
                              ),
                              Text(
                                'Country : ${controller.invoiceList.value.data?.lawyer?.country.toString()}',
                                style: AppTextStyles.kSmall10RegularTextStyle,
                              ),
                              Text(
                                'Currency : INR',
                                style: AppTextStyles.kSmall10RegularTextStyle,
                              ),
                              Text(
                                'Mob No : ${controller.invoiceList.value.data?.lawyer?.mobile.toString()}',
                                style: AppTextStyles.kSmall10RegularTextStyle,
                              ),
                              Text(
                                'Area : ${controller.invoiceList.value.data?.lawyer?.address.toString()}',
                                style: AppTextStyles.kSmall10RegularTextStyle,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () async {
                              await generateInvoicePdf(widget.paymentId);
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
                                'Customer : ${controller.invoiceList.value.data?.client?.name.toString()}',
                              ),
                              Text(
                                'Area :${controller.invoiceList.value.data?.client?.address.toString()}',
                              ),
                              Text(
                                'City :${controller.invoiceList.value.data?.client?.city.toString()}',
                              ),
                              Text(
                                'State :${controller.invoiceList.value.data?.client?.state.toString()}',
                              ),
                              Text(
                                'Country :${controller.invoiceList.value.data?.client?.country.toString()}',
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Invoice Date :',
                                style: AppTextStyles.kSmall10SemiBoldTextStyle,
                              ),
                              Text(
                                '${controller.invoiceList.value.data?.client?.createdDate.toString()}',
                                style: AppTextStyles.kSmall10RegularTextStyle,
                              ),
                              Text(
                                'Reference# :',
                                style: AppTextStyles.kSmall10SemiBoldTextStyle,
                              ),
                              Text(
                                '${controller.invoiceList.value.data?.paymentNo.toString()}',
                                style: AppTextStyles.kSmall10RegularTextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Service',
                            style: AppTextStyles.kSmall10SemiBoldTextStyle,
                          ),
                          Text(
                            'Payment\nMethod',
                            style: AppTextStyles.kSmall10SemiBoldTextStyle,
                          ),
                          Text(
                            'Status',
                            style: AppTextStyles.kSmall10SemiBoldTextStyle,
                          ),
                          Text(
                            'Total\nAmount',
                            style: AppTextStyles.kSmall10SemiBoldTextStyle,
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${controller.invoiceList.value.data?.lawyer?.servicesOffered.toString()}',
                            style: AppTextStyles.kSmall10RegularTextStyle,
                          ),
                          Text(
                            '${controller.invoiceList.value.data?.paymentMethod.toString()}',
                            style: AppTextStyles.kSmall10RegularTextStyle,
                          ),
                          Text(
                            '${controller.invoiceList.value.data?.status.toString()}',
                            style: AppTextStyles.kSmall10RegularTextStyle,
                          ),
                          Text(
                            '${controller.invoiceList.value.data?.paymentAmount.toString()}',
                            style: AppTextStyles.kSmall10RegularTextStyle,
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        children: [
                          const Divider(
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Amount',
                                style: AppTextStyles.kSmall10SemiBoldTextStyle,
                              ),
                              Text(
                                '${controller.invoiceList.value.data?.paymentAmount.toString()}',
                                style: AppTextStyles.kSmall8SemiBoldTextStyle,
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                        ],
                      ).marginOnly(left: 160),
                      const SizedBox(
                        height: 25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Terms and Conditions :',
                            style: AppTextStyles.kBody15SemiBoldTextStyle,
                          ),
                          Text(
                            'Pay according to Terms and conditions.',
                            style: AppTextStyles.kSmall10RegularTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ).paddingAll(8),
                ),
        ));
  }
}
