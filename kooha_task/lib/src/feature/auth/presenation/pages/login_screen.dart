import 'package:flutter/material.dart';
import 'package:kooha_task/src/core/app_export.dart';
import 'package:kooha_task/src/feature/dashboard/wallet_screen.dart';
import 'package:kooha_task/src/widgets/app_bar/appbar_button.dart';
import 'package:kooha_task/src/widgets/app_bar/appbar_iconbutton.dart';
import 'package:kooha_task/src/widgets/app_bar/custom_app_bar.dart';
import 'package:kooha_task/src/widgets/custom_elevated_button.dart';
import 'package:kooha_task/src/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          leadingWidth: 64.h,
          leading: AppbarIconbutton(
              svgPath: ImageConstant.imgArrowleft,
              margin: EdgeInsets.only(left: 24.h, top: 8.v, bottom: 8.v),
              onTap: () {
                Navigator.pop(context);
              }),
          title: AppbarButton(margin: EdgeInsets.only(left: 102.h))),
      body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 30.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Welcome Back!", style: theme.textTheme.headlineSmall),
            SizedBox(height: 8.v),
            Text("Be ready to use kooha_task/src in less than 2min ⚡️",
                style: CustomTextStyles.titleSmallGray500),
            SizedBox(height: 39.v),
            Text("Email address", style: CustomTextStyles.titleSmallMedium),
            SizedBox(height: 4.v),
            CustomTextFormField(
                controller: emailController,
                hintText: "justinculhane@gmailcom",
                textInputAction: TextInputAction.next,
                suffix: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 16.v, 16.h, 16.v),
                    child:
                        CustomImageView(svgPath: ImageConstant.imgCheckmark)),
                suffixConstraints: BoxConstraints(maxHeight: 56.v),
                borderDecoration: TextFormFieldStyleHelper.outlineGray),
            SizedBox(height: 24.v),
            Text("Password", style: CustomTextStyles.titleSmallMedium),
            SizedBox(height: 4.v),
            CustomTextFormField(
                controller: passwordController,
                hintText: "justinculhane@gmailcom",
                textInputAction: TextInputAction.done,
                // suffix: Container(
                //     margin: EdgeInsets.fromLTRB(30.h, 16.v, 16.h, 16.v),
                //     child:
                //         CustomImageView(svgPath: ImageConstant.imgCheckmark)),
                // suffixConstraints: BoxConstraints(maxHeight: 56.v),
                borderDecoration: TextFormFieldStyleHelper.outlineGray),
            Spacer(),
            SizedBox(height: 6.v),
            Align(
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                      padding: EdgeInsets.only(top: 1.v),
                      child: Text("Forgot Password?",
                          style: CustomTextStyles.titleSmallErrorContainer)),
                  Padding(
                      padding: EdgeInsets.only(left: 8.h),
                      child: Text("Reset it",
                          style: CustomTextStyles.titleSmallAmberA700))
                ])),
          ])),
      bottomNavigationBar: CustomElevatedButton(
        text: "Log me in",
        isDisabled: false,
        margin: EdgeInsets.only(left: 25.h, right: 24.h, bottom: 48.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WalletEmptyStateScreen(),
            ),
          );
        },
      ),
    );
  }
}
