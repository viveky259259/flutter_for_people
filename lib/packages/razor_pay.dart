import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayExample extends StatefulWidget {
  @override
  _RazorPayExampleState createState() => _RazorPayExampleState();
}

class _RazorPayExampleState extends State<RazorPayExample> {
  Razorpay _razorPay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
//    Fluttertoast.showToast(
//        msg: "SUCCESS: " + response.paymentId, timeInSecForIos: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
//    Fluttertoast.showToast(
//        msg: "ERROR: " + response.code.toString() + " - " + response.message,
//        timeInSecForIos: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
//    Fluttertoast.showToast(
//        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }

  var options = {
    'key': 'rzp_test_Teb9HFHdOsZOZ1',
    'amount': 100, //in the smallest currency sub-unit.
    'name': 'Acme Corp.',
    'description': 'Fine T-Shirt',
    'prefill': {'contact': '9123456789', 'email': 'gaurav.kumar@example.com'},
    'external': {
      'wallets': ['paytm']
    }
  };

  @override
  void initState() {
    super.initState();
    _razorPay = Razorpay();
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  doCheckout() {
    try {
      _razorPay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Razorpay example'),
      ),
      body: RaisedButton(
        onPressed: doCheckout,
        child: Text("Checkout"),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _razorPay.clear();
  }
}
