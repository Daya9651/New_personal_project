
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/widget/const_shimmer_effects.dart';
import '../../../../common/widget/custom_date_picker.dart';
import '../../../../const/const_height.dart';
import '../../../../const/const_width.dart';
import '../../../../const/image_strings.dart';
import '../../../../helpers/string_to_date_function.dart';
import '../../../../style/color.dart';
import '../controllers/client_transaction_controller.dart';
import '../controllers/lawyer_my_transaction_controller.dart';

class LawyerMyTransaction extends GetView<LawyerMyTransactionController> {
  const LawyerMyTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Transactions",
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(h50),
            child: ConstTextField(
              controller: controller.searchTransactionController.value,
              onChanged: (value) {
                controller.getMyTransactions(search: value);
              },
              hintText: "Search Transactions",
              enableBorderColor: AppColors.white,
              suffixIcon: IconButton(onPressed: (){
                controller.searchTransactionController.value.clear();
                controller.getMyTransactions();

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
              color:transaction.status=="Unpaid" ?AppColors.white:AppColors.success10,
              child: ListTile(
                title: const8TextBold("${transaction.plan?.type}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const6Text(" ${transaction.plan?.type} ${transaction.paymentMethod}"),
                    const6Text("Date & Time: ${formatDateTime(DateTime.parse(transaction.createdDate??""))}"),
                    const6Text("Method: ${transaction.paymentMethod}"),
                    const6Text("Amount: ₹${transaction.plan?.price}"),
                    const6Text("Discount: ₹${transaction.plan?.discount}"),
                    const6Text("Gst: ₹${transaction.plan?.gst}"),
                    const8TextBold("Total Amount: ₹${transaction.totalPayableAmount}",textColor: AppColors.success40),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
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
