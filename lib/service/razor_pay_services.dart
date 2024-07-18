// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:likhit/utils/const_toast.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class RazorpayService {
//   static final RazorpayService _instance = RazorpayService._internal();
//   late Razorpay _razorpay;
//   String? orderID;
//   factory RazorpayService() {
//     return _instance;
//   }
//
//   RazorpayService._internal() {
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     // Do something when payment succeeds
//     ConstToast.to.showSuccess('${response.orderId}');
//     debugPrint('Payment Success: ${response.orderId} ${response.data}');
//   }
//
//   void _handlePaymentError(PaymentFailureResponse response) {
//     // Do something when payment fails
//     ConstToast.to.showError('${response.message}');
//     debugPrint('Payment Error: ${response.message}');
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     // Do something when an external wallet was selected
//     ConstToast.to.showInfo('${response.walletName}');
//     debugPrint('External Wallet: ${response.walletName}');
//   }
//   Future<String?> waitForOrderID() async {
//     Completer<String?> completer = Completer();
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, (PaymentFailureResponse response) {
//       completer.complete(null);
//     });
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (PaymentSuccessResponse response) {
//       orderID = response.paymentId;
//       completer.complete(response.paymentId);
//     });
//     return completer.future;
//   }
//
//   void openCheckout({ String? key, required int amount,  String ?name,  String ?description,  String? contact,  String ?email}) {
//     var options = {
//       'key': 'rzp_test_sww6eyRpjsDmO2', //testing
//       // 'key': 'rzp_live_eUVhpnLutzJQU2', //live
//       'amount': amount,
//       'name': name??"LikhitDe",
//       'description': description,
//       'prefill': {
//         'contact': 8881108821,
//         'email': "aaragroups.com"
//       }
//     };
//
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   void clear() {
//     _razorpay.clear();
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:likhit/utils/const_toast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';



class RazorpayService {
  static final RazorpayService _instance = RazorpayService._internal();
  late Razorpay _razorpay;
  final Completer<PaymentSuccessResponse?> _paymentCompleter =
  Completer<PaymentSuccessResponse?>();

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
    debugPrint('Payment Success: ${response.data}');
    if (!_paymentCompleter.isCompleted) {
      _paymentCompleter.complete(response);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint('Payment Error: ${response.message}${response}');
    if (!_paymentCompleter.isCompleted) {
      _paymentCompleter.complete(null);
    }
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint('External Wallet: ${response.walletName}');
    if (!_paymentCompleter.isCompleted) {
      _paymentCompleter.complete(null);
    }
  }

  Future<PaymentSuccessResponse?> waitForPaymentResponse() async {
    return _paymentCompleter.future;
  }

  void openCheckout(
      {String? key,
        required int amount,
        String? name,
        String? description,
        String? contact,
        String? orderId,
        String? email}) {
    var options = {
      'key': 'rzp_test_sww6eyRpjsDmO2', // testing
      // 'key': 'rzp_live_eUVhpnLutzJQU2', // live
      'amount': amount * 100,
      'name': name ?? "LikhitDe",
      'order_id': orderId,
      'description': description ?? "",
      'prefill': {
        'contact': contact ?? "8881108821",
        'email': email ?? "aaragroups.com"
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error in openCheckout: $e');
    }
  }

  void clear() {
    _razorpay.clear();
    if (!_paymentCompleter.isCompleted) {
      _paymentCompleter.complete(null);
    }
  }
}

