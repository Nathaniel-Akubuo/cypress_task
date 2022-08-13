import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utilities/app_strings.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/error.json'),
        const Text(
          AppStrings.somethingWentWrong,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
