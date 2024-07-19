import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/common/widget/const_text_for_text_fields.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/payment_request_only_controller.dart';
import 'package:likhit/screens/lawyer_screen/screens/models/client_list_model.dart';

import '../../../../common/widget/primary_button.dart';
import '../../../../const/const_height.dart';

class PaymentRequestOnlyPage extends GetView<PaymentRequestOnlyController> {
  const PaymentRequestOnlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Request Payment",
      ),
      body:Obx(()=>controller.isLoading.value?const Center(child: CircularProgressIndicator()) :ListView(
        children: [
          ConstWidgets.constTextForTextFields(
            width: double.maxFinite,
       "Client",
          Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) async {
                final suggestions = controller.getClientSuggestions(
                    textEditingValue.text.toLowerCase());
                debugPrint(" $suggestions");
                return suggestions;
              },
              onSelected: (String selection) {
                final client = controller.clientList.value.data?.firstWhere(
                      (element) => element.clientName == selection,
                  orElse: () => Data(),
                );
                if (client != null) {
                  controller.selectClient(client.clientName.toString(), client.clientId??0);
                }
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                controller.searchTransactionController.value =
                    textEditingController;
                return ConstTextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  onChanged: (value) {
                    // Optionally handle onChanged to update suggestions
                  },
                    hintText: 'Type to search clients',
                );
              },
            ),
            mandatory: true,
          ),
          ConstWidgets.constTextForTextFields(
            width: double.maxFinite,
        "Amount",
        ConstTextField(
          controller: controller.amountController.value,
          inputType: TextInputType.number,
        ),
        mandatory: true,

      ),  ConstWidgets.constTextForTextFields(
            width: double.maxFinite,
        "Payment reason",
        ConstTextField(
          controller: controller.paymentReasonController.value,
          maxLine: 5,
        ),
        mandatory: true,

      ),
          ConstWidgets.constTextForTextFields(
            width: double.maxFinite,
            "Expiry time (Max 60 min)",
            ConstTextField(
              maxLength: 2,
              controller: controller.expiryTimeController.value,
              inputType: TextInputType.number,
            ),
            mandatory: true,

          ),
SizedBox(
  height: h20,
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    constTextContainer(
        "Confirm",
      onTap: (){
          controller.lawyerRequestPayment();
          // controller.buyPlan();
      }
    ),     constTextContainer(
        "Cancel"
    ),
  ],
)


        ],
      )),
    );
  }
}
