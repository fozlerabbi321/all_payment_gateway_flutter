import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/size_config.dart';
import '../../widgets/default_btn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultBtn(
              width: SizeConfig.screenWidth,
              radius: 10.0,
              title: 'Stripe'.tr,
              onPress: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
