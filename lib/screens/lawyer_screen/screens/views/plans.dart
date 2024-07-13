import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_plans_controller.dart';
import 'package:likhit/screens/lawyer_screen/screens/models/lawyer_plan_model.dart';
import '../../../../common/widget/const_text_with_styles.dart';
import '../../../../const/const_height.dart';
import '../../../../const/const_width.dart';
import '../../../../style/color.dart';
import '../../../../style/text_style.dart';

class LawyerPlans extends GetView<LawyerPlansController> {
  const LawyerPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(h16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                constTabButton("Subscriptions", 0),
                constTabButton("NFC Card", 1),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.currentIndex.value == 0 &&
            (controller.lawyerSubscriptionPlanList.value.plan == null ||
                controller.lawyerSubscriptionPlanList.value.planPrices!.isEmpty)) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.currentIndex.value == 1 &&
            (controller.lawyerPlanList.value.plan == null ||
                controller.lawyerPlanList.value.planPrices!.isEmpty)) {
          return const Center(child: CircularProgressIndicator());
        }

        var selectedList = controller.currentIndex.value == 0
            ? controller.lawyerSubscriptionPlanList.value.planPrices
            : controller.lawyerPlanList.value.planPrices;

        if (selectedList == null || selectedList.isEmpty) {
          return const Center(child: Text("No transactions found."));
        }

        return RefreshIndicator(
          onRefresh: controller.refreshData,
          child: ListView.builder(
            itemCount: selectedList.length,
            itemBuilder: (context, index) {
              var transaction = selectedList[index];
              bool isSelected = controller.currentIndex.value == 0
                  ? controller.isSelectedSubs(index)
                  : controller.isSelectedNFc(index);

              return ConstantContainer(
                radiusBorder: w5,
                borderColor: isSelected ? Colors.blue : AppColors.white50,
                padding: w3,
                child: ListTile(
                  leading: CircleAvatar(
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                      NetworkImage(transaction.typeImage ?? ""),
                    ),
                  ),
                  title: const8TextBold("${transaction.type}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const6TextBoldUnderLine(
                          "Price: ${transaction.price}",
                          textColor: AppColors.white50),
                      const8TextBold(
                          "Payable Amount: ${transaction.discountPrice}",
                          textColor: AppColors.success40),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: isSelected
                        ? const Icon(Icons.check_circle_outline,
                        color: Colors.blue)
                        : const Icon(Icons.circle_outlined,
                        color: Colors.redAccent),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  Widget constTabButton(String text, int index) {
    return Obx(() => InkWell(
      onTap: () {
        controller.currentIndex.value = index;
      },
      child: ConstantContainer(
        radiusBorder: w5,
        borderColor: AppColors.white,
        borderWidth: 0.5,
        color: controller.currentIndex.value == index
            ? AppColors.white
            : null,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w25, vertical: h5),
          child: textWithoutStyle(
            text,
            AppTextStyles.kCaption12RegularTextStyle.copyWith(
              color: controller.currentIndex.value == index
                  ? AppColors.white100
                  : AppColors.white,
            ),
          ),
        ),
      ),
    ));
  }
}
