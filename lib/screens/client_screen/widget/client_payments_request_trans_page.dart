
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/widget/const_shimmer_effects.dart';
import '../../../../const/const_height.dart';
import '../../../../const/const_width.dart';
import '../../../../helpers/string_to_date_function.dart';
import '../../../../style/color.dart';
import '../services/controller/client_payments_trans_controller.dart';

class ClientPaymentsRequestTransPage extends GetView<ClientPaymentsTransController> {
  const ClientPaymentsRequestTransPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Client Transactions",
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(h50),
            child: ConstTextField(
              controller: controller.searchTransactionController.value,
              onChanged: (value) {
                controller.getClientDirectTransactions(search: value);
              },
              hintText: "Search Transactions",
              enableBorderColor: AppColors.white,
              suffixIcon: IconButton(onPressed: (){
                controller.searchTransactionController.value.clear();
                controller.getClientDirectTransactions();

              }, icon: const Icon(CupertinoIcons.multiply_circle,color: AppColors.white,)),
            )
        ),
      ),
      body:Obx(() {
        if (controller.clientTransactionList.value.data == null ) {
          return Center(
            child: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highLightColor,
              child: loadSke(),
            ),
          );
        }

        if (controller.clientTransactionList.value.data!.isEmpty) {
          return const Center(child: Text("No transactions found."));
        }

        return ListView.builder(
          itemCount: controller.clientTransactionList.value.data!.length,
          itemBuilder: (context, index) {
            var transaction = controller.clientTransactionList.value.data![index];

            return ConstantContainer(
              radiusBorder: w5,
              borderColor: AppColors.white50,
              padding: w3,
              color:transaction.status=="Unpaid" ?AppColors.white:AppColors.success10,
              child: ListTile(
                title: const8TextBold(transaction.lawyer?.name.toString().toUpperCase()??""),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const6Text("${transaction.paymentLink}\nId:${transaction.paymentId}"),
                    const6Text("Date & Time: ${formatDateTime(DateTime.parse(transaction.createdDate??""))}"),
                    const6Text("Service Name: ${transaction.paymentFor}"),
                    const8TextBold("Amount: ₹${transaction.paymentAmount?.toStringAsFixed(2)}", textColor: AppColors.success40),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () async {

                    // await Get.to(() =>  DirectTransactionInvoice(paymentId: int.parse(transaction.id.toString()),));
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
