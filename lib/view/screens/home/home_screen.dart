import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystarter/constants/style_data.dart';

import '../../../constants/size_config.dart';
import '../../../helper/stripe_payment_helpter.dart';
import '../../widgets/default_btn.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20,),
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
                title: 'Flutterwave'.tr,
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
                title: 'Pastack'.tr,
                onPress: () async {
                  await StripePaymentHelper().makePayment(
                    context: context,
                    amount: '250',
                  );
                },
              ),
              kHeightBox10,
            ],
          ),
        ),
      ),
    );
  }
}
