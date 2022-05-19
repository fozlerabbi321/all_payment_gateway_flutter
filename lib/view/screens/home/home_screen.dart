import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:get/get.dart';
import 'package:mystarter/constants/strings.dart';
import 'package:mystarter/constants/style_data.dart';
import 'package:mystarter/view/screens/gateway/flutter_wave_screen.dart';

import '../../../constants/size_config.dart';
import '../../../helper/stripe_payment_helpter.dart';
import '../../widgets/default_btn.dart';
import '../gateway/paystack_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Gateway List'.tr,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeightBox30,
              DefaultBtn(
                width: SizeConfig.screenWidth,
                radius: 10.0,
                title: 'Stripe'.tr,
                onPress: () async {
                  await StripePaymentHelper().makePayment(
                    context: context,
                    amount: '250',
                  );
                },
              ),
              kHeightBox10,
              DefaultBtn(
                width: SizeConfig.screenWidth,
                radius: 10.0,
                title: 'Paypal'.tr,
                onPress: () async {
                  handlePaypalPayment(
                    context,
                  );
                },
              ),
              kHeightBox10,
              DefaultBtn(
                width: SizeConfig.screenWidth,
                radius: 10.0,
                title: 'Flutterwave'.tr,
                onPress: () async {
                 Get.to(() => const FlutterWaveScreen());

                },
              ),
              kHeightBox10,
              DefaultBtn(
                width: SizeConfig.screenWidth,
                radius: 10.0,
                title: 'Pastack'.tr,
                onPress: () async {
                  Get.to(() => const PayStackScreen());
                },
              ),
              kHeightBox10,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> handlePaypalPayment(BuildContext context)async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => UsePaypal(
          sandboxMode: true,
          clientId: kPaypalClientId,
          secretKey: kPaypalSecretKey,
          returnURL: "https://samplesite.com/return",
          cancelURL: "https://samplesite.com/cancel",
          transactions: const [
            {
              "amount": {
                "total": '200.12',
                "currency": "USD",
                "details": {
                  "subtotal": '200.12',
                  "shipping": '0',
                  "shipping_discount": 0
                }
              },
              "description":
              "The payment transaction description.",
              // "payment_options": {
              //   "allowed_payment_method":
              //       "INSTANT_FUNDING_SOURCE"
              // },
              "item_list": {
                "items": [
                  {
                    "name": "A demo product",
                    "quantity": 1,
                    "price": '200.12',
                    "currency": "USD"
                  }
                ],

                // shipping address is not required though
                "shipping_address": {
                  "recipient_name": kName,
                  "line1": "Travis County",
                  "line2": "",
                  "city": "Austin",
                  "country_code": "US",
                  "postal_code": "73301",
                  "phone": "+00000000",
                  "state": "Texas"
                },
              }
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
          },
          onError: (error) {
            log("onError: $error");
          },
          onCancel: (params) {
            log('cancelled: $params');
          },
        ),
      ),
    );
  }
}
