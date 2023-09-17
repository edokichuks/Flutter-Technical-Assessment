import 'package:flutter/material.dart';
import 'package:kooha_task/src/core/app_export.dart';
import 'package:kooha_task/src/core/utils/app_dimensions.dart';
import 'package:kooha_task/src/widgets/custom_bottom_bar.dart';
import 'package:kooha_task/src/widgets/custom_drop_down.dart';
import 'package:kooha_task/src/widgets/custom_elevated_button.dart';

class WalletEmptyStateScreen extends StatelessWidget {
  WalletEmptyStateScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 23.v),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24.h),
                  child: Text(
                    "Wallet",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              SizedBox(height: 9.v),
              Text(
                "Balance",
                style: CustomTextStyles.titleSmallSecondaryContainer,
              ),
              SizedBox(height: 15.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 1.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "₦",
                      style: CustomTextStyles.headlineLargeInter,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      "0.00",
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.v),
              CustomElevatedButton(
                width: 193.h,
                text: "Withdraw",
                buttonStyle: CustomButtonStyles.fillPrimary,
              ),
              SizedBox(height: 32.v),
              const Divider(),
              CustomDropDown(
                width: 100.h,
                icon: Container(
                  margin: EdgeInsets.only(left: 5.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgArrowdown,
                  ),
                ),
                margin: EdgeInsets.only(
                  left: 24.h,
                  top: 23.v,
                ),
                hintText: "Transactions",
                alignment: Alignment.centerLeft,
                items: dropdownItemList,
                onChanged: (value) {},
              ),
              SizedBox(height: 89.v),
              Container(
                height: 150.h,
                width: 150.h,
                padding: const EdgeInsets.all(AppDimensions.big),
                decoration: const BoxDecoration(
                    color: Color(0XFF333333), shape: BoxShape.circle),
                child: CustomImageView(
                  imagePath: ImageConstant.noTrans,
                  height: 150.adaptSize,
                  width: 150.adaptSize,
                ),
              ),
              SizedBox(height: 24.v),
              SizedBox(
                width: 142.h,
                child: Text(
                  "No withdrawal history recorded yet",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleSmallSecondaryContainer_1,
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            
          },
        ),
      ),
    );
  }
}
