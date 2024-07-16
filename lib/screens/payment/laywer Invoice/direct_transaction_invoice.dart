import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/screens/payment/controller/payment_controller.dart';
import 'package:likhit/style/text_style.dart';

class DirectTransactionInvoice extends StatefulWidget {
  const DirectTransactionInvoice({super.key});

  @override
  State<DirectTransactionInvoice> createState() => _InvoicingState();
}

class _InvoicingState extends State<DirectTransactionInvoice> {
  PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    debugPrint('Daya : ${controller.invoiceDirectList.value.data?[0].status}');
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const Text('Invoice Date :',),
                        Text('${controller.invoiceList.value.data?.client?.createdDate.toString()}'),
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
                          Divider(color: Colors.black,),
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
                    Text('${controller.invoiceList.value.data?.lawyer?.servicesOffered.toString()}'),
                    SizedBox(
                      width: 70,
                      child: Column(
                        children: [
                          Text('${controller.invoiceList.value.data?.paymentAmount.toString()}'),
                          const Divider(color: Colors.black,),
                           Text('${controller.invoiceList.value.data?.likhitDeCommission.toString()}')
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
                        const Text('Split GST',),
                        Text('${controller.invoiceList.value.data?.splitGstAmt}')
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('LikhitDe GST',),
                        Text('${controller.invoiceList.value.data?.likhitGstAmt}')
                      ],
                    ),
                    const Divider(color: Colors.black,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Gateway Charge'),
                        Text('${controller.invoiceList.value.data?.getwayAmt.toString()}',),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('LikhitDe Payable Amount', style: AppTextStyles.kSmall8SemiBoldTextStyle,),
                        Text(((controller.invoiceList.value.data?.likhitDeNetAmt?? 0)*10/100).toString(),),
                      ],
                    ),
                    const Divider(color: Colors.black,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lawyer Payable Amount', style: AppTextStyles.kSmall8SemiBoldTextStyle,),
                        Text('${controller.invoiceList.value.data?.paymentAmount.toString()}',),
                      ],
                    ),
                    const Divider(color: Colors.black,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount', style: AppTextStyles.kSmall8SemiBoldTextStyle,),
                        Text('${controller.invoiceList.value.data?.paymentAmount.toString()}', style: AppTextStyles.kSmall8SemiBoldTextStyle,),
                      ],
                    ),
                  ],
                ).marginOnly(left: 130),
                const SizedBox(height: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Terms and Conditions',style: AppTextStyles.kBody15SemiBoldTextStyle,),
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
