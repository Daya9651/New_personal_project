import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/const/const_width.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/screens/payment/controller/payment_controller.dart';
import 'package:likhit/style/text_style.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

import '../../../common/widget/const_shimmer_effects.dart';
import '../../../style/color.dart';

class ClientPaymentInvoice extends StatefulWidget {
  final int paymentId;

  const ClientPaymentInvoice({super.key, required this.paymentId, });

  @override
  State<ClientPaymentInvoice> createState() => _InvoicingState();
}

class _InvoicingState extends State<ClientPaymentInvoice> {
  PaymentController controller = Get.put(PaymentController());

  @override
  void initState() {
    super.initState();
    debugPrint("payment id on pdf ${widget.paymentId}");
    controller.getPaymentClientRequestInvoiceData(widget.paymentId);
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
                          '${controller.invoicePaymentRequestDirectList.value.data?.paymentId}',
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
                          'Lawyer Name : ${controller.invoicePaymentRequestDirectList.value.data?.lawyer?.name.toString()}',
                          style: AppTextStyles.kSmall10RegularTextStyle,
                        ),
                        Text(
                          'City : ${controller.invoicePaymentRequestDirectList.value.data?.lawyer?.city.toString()}',
                          style: AppTextStyles.kSmall10RegularTextStyle,
                        ),
                        Text(
                          'State : ${controller.invoicePaymentRequestDirectList.value.data?.lawyer?.state.toString()}',
                          style: AppTextStyles.kSmall10RegularTextStyle,
                        ),
                        Text(
                          'Country : ${controller.invoicePaymentRequestDirectList.value.data?.lawyer?.country.toString()}',
                          style: AppTextStyles.kSmall10RegularTextStyle,
                        ),
                        Text(
                          'Currency : INR',
                          style: AppTextStyles.kSmall10RegularTextStyle,
                        ),
                        Text(
                          'Mob No : ${controller.invoicePaymentRequestDirectList.value.data?.lawyer?.mobile.toString()}',
                          style: AppTextStyles.kSmall10RegularTextStyle,
                        ),
                        Text(
                          'Area : ${controller.invoicePaymentRequestDirectList.value.data?.lawyer?.address.toString()}',
                          style: AppTextStyles.kSmall10RegularTextStyle,
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        // await generateInvoicePdf(widget.paymentId);
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
                          'Customer : ${controller.invoicePaymentRequestDirectList.value.data?.client?.name.toString()}',
                        ),
                        Text(
                          'Area :${controller.invoicePaymentRequestDirectList.value.data?.client?.address.toString()}',
                        ),
                        Text(
                          'City :${controller.invoicePaymentRequestDirectList.value.data?.client?.city.toString()}',
                        ),
                        Text(
                          'State :${controller.invoicePaymentRequestDirectList.value.data?.client?.state.toString()}',
                        ),
                        Text(
                          'Country :${controller.invoicePaymentRequestDirectList.value.data?.client?.country.toString()}',
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
                          '${controller.invoicePaymentRequestDirectList.value.data?.client?.createdDate.toString()}',
                          style: AppTextStyles.kSmall10RegularTextStyle,
                        ),
                        Text(
                          'Reference :',
                          style: AppTextStyles.kSmall10SemiBoldTextStyle,
                        ),
                        Text(
                          '${controller.invoicePaymentRequestDirectList.value.data?.paymentId.toString()}',
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
                      '${controller.invoicePaymentRequestDirectList.value.data?.lawyer?.servicesOffered.toString()}',
                      style: AppTextStyles.kSmall10RegularTextStyle,
                    ),
                    Text(
                      '${controller.invoicePaymentRequestDirectList.value.data?.id.toString()??""}',
                      style: AppTextStyles.kSmall10RegularTextStyle,
                    ),
                    Text(
                      '${controller.invoicePaymentRequestDirectList.value.data?.status.toString()}',
                      style: AppTextStyles.kSmall10RegularTextStyle,
                    ),
                    Text(
                      '${controller.invoicePaymentRequestDirectList.value.data?.paymentAmount.toString()}',
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
                          '${controller.invoicePaymentRequestDirectList.value.data?.paymentAmount.toString()}',
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
            ).paddingAll(w8),
          ),
        ));
  }
}