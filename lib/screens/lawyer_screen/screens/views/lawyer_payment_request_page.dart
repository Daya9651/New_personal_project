import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_payment_request_controller.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../common/widget/const_shimmer_effects.dart';
import '../../../../const/const_height.dart';
import '../../../../const/const_width.dart';
import '../../../../helpers/string_to_date_function.dart';
import '../../../../style/color.dart';
import '../../../payment/laywer Invoice/request_transaction_invoice.dart';

class LawyerPaymentRequestPage extends GetView<LawyerPaymentRequestController> {
  const LawyerPaymentRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: "Payment Requests",
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(h50),
            child: ConstTextField(
              controller: controller.searchTransactionController.value,
              onChanged: (value) {
                controller.getPaymentRequestTransactions(search: value);
              },
              hintText: "Search Transactions",
              enableBorderColor: AppColors.white,
              suffixIcon: IconButton(onPressed: (){
                controller.searchTransactionController.value.clear();
                controller.getPaymentRequestTransactions();

              }, icon: const Icon(CupertinoIcons.multiply_circle,color: AppColors.white,)),
            )
        ),
      ),
      body:Obx(() {
        if (controller.myTransactionList.value.data == null) {
          return Center(
            child: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highLightColor,
              child: loadSke(),
            ),
          );
        }

        if (controller.myTransactionList.value.data!.isEmpty) {
          return const Center(child: Text("No transactions found."));
        }

        return ListView.builder(
          itemCount: controller.myTransactionList.value.data!.length,
          itemBuilder: (context, index) {
            var transaction = controller.myTransactionList.value.data![index];

            return ConstantContainer(
              radiusBorder: w5,
              borderColor: AppColors.white50,
              padding: w3,
              color:transaction.status=="Expired" ?AppColors.error10:AppColors.white,
              child: ListTile(
                title: const8TextBold("${transaction.client?.name}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const6Text(" ${transaction.paymentId}"),
                    const6Text("Date & Time: ${formatDateTime(DateTime.parse(transaction.createdDate??""))}"),
                    const6Text("Expiry: ${formatDateTime(DateTime.parse(transaction.expiryTime??""))}"),
                    const6Text("Service: ₹${transaction.paymentFor}"),
                    const6Text("Payment Link: ₹${transaction.paymentLink}"),
                    const8TextBold("Total Amount: ${transaction.paymentAmount}",textColor: AppColors.success40),
                    const6TextBold("Status: ${transaction.status}",textColor: AppColors.info20),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () async {

                    await Get.to(() => RequestTransactionInvoice(paymentId: transaction.id??0,));
                  },
                  icon: const Icon(Icons.picture_as_pdf, color: Colors.redAccent),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
