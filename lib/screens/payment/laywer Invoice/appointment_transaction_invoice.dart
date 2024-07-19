import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/screens/payment/controller/payment_controller.dart';
import 'package:likhit/style/text_style.dart';

class AppointmentTransactionInvoice extends StatefulWidget {
  const AppointmentTransactionInvoice({super.key});

  @override
  State<AppointmentTransactionInvoice> createState() => _InvoicingState();
}

class _InvoicingState extends State<AppointmentTransactionInvoice> {
  PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          title: 'Invoices',
        ),
        body:Obx(()=> Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
                        Text('Lawyer Name : ${controller.invoiceList.value.data?.lawyer?.name.toString()}'),
                        Text('City : ${controller.invoiceList.value.data?.lawyer?.city.toString()}'),
                        Text('State : ${controller.invoiceList.value.data?.lawyer?.state.toString()}'),
                        Text('Country : ${controller.invoiceList.value.data?.lawyer?.country.toString()}'),
                        const Text('Currency : INR'),
                        Text('Mob No : ${controller.invoiceList.value.data?.lawyer?.mobile.toString()}'),
                        Text('Area : ${controller.invoiceList.value.data?.lawyer?.address.toString()}'),
                      ],
                    ),

                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bill To', style: AppTextStyles.kBody15SemiBoldTextStyle,),
                        Text('Customer : ${controller.invoiceList.value.data?.client?.name.toString()}'),
                        // Text('Mobile :${controller.invoiceList.value.data?.client?.mobile.toString()}'),
                        Text('Area :${controller.invoiceList.value.data?.client?.address.toString()}'),
                        Text('City :${controller.invoiceList.value.data?.client?.city.toString()}'),
                        Text('State :${controller.invoiceList.value.data?.client?.state.toString()}'),
                        Text('Country :${controller.invoiceList.value.data?.client?.country.toString()}'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Invoice Date :',style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                         Text('${controller.invoiceList.value.data?.client?.createdDate.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                         Text('Reference# :', style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                         Text('${controller.invoiceList.value.data?.paymentNo.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,)
                      ],
                    )
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Service', style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                    Text('Payment\nMethod', style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                    Text('Status', style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                    Text('Total\nAmount', style: AppTextStyles.kSmall10SemiBoldTextStyle,),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${controller.invoiceList.value.data?.lawyer?.servicesOffered.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                    Text('${controller.invoiceList.value.data?.paymentMethod.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                    Text('${controller.invoiceList.value.data?.status.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
                    Text('${controller.invoiceList.value.data?.paymentAmount.toString()}', style: AppTextStyles.kSmall10RegularTextStyle,),
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
                        Text('${controller.invoiceList.value.data?.paymentAmount.toString()}', style: AppTextStyles.kSmall8SemiBoldTextStyle,),
                      ],
                    ),
                    const Divider(color: Colors.black,),
                  ],
                ).marginOnly(left: 150),
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
            ),
          ),
        ))
    );
  }
}

