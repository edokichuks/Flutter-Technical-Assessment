import 'package:flutter/material.dart';
import 'package:kooha_task/src/core/app_export.dart';
import 'package:kooha_task/src/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class AppbarButton extends StatelessWidget {
  AppbarButton({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomElevatedButton(
          height: 39.v,
          width: 200.h,
          text: "Switch to Create account",
          buttonTextStyle: CustomTextStyles.titleSmallAmberA700Medium,
        ),
      ),
    );
  }
}
