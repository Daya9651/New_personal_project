import 'package:flutter/material.dart';
import 'package:likhit/utils/const_toast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayService {
  static final RazorpayService _instance = RazorpayService._internal();
  late Razorpay _razorpay;

  factory RazorpayService() {
    return _instance;
  }

  RazorpayService._internal() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    ConstToast.to.showSuccess('${response.signature}');
    debugPrint('Payment Success: ${response.signature}');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    ConstToast.to.showError('${response.message}');
    debugPrint('Payment Error: ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    ConstToast.to.showInfo('${response.walletName}');
    debugPrint('External Wallet: ${response.walletName}');
  }

  void openCheckout({ String? key, required int amount,  String ?name,  String ?description,  String? contact,  String ?email}) {
    var options = {
      'key': 'rzp_test_sww6eyRpjsDmO2', //testing
      // 'key': 'rzp_live_eUVhpnLutzJQU2', //live
      'amount': amount,
      'name': name??"LikhitDe",
      'description': description,
      'prefill': {
        'contact': 888110882,
        'email': "aaragroups.com"
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void clear() {
    _razorpay.clear();
  }
}
