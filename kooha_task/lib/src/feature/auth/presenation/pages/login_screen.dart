import 'package:flutter/material.dart';
import 'package:kooha_task/src/core/app_export.dart';
import 'package:kooha_task/src/widgets/app_bar/appbar_button.dart';
import 'package:kooha_task/src/widgets/app_bar/appbar_iconbutton.dart';
import 'package:kooha_task/src/widgets/app_bar/custom_app_bar.dart';
import 'package:kooha_task/src/widgets/custom_elevated_button.dart';
import 'package:kooha_task/src/widgets/custom_text_form_field.dart';


// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: 64.h,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: EdgeInsets.only(left: 24.h, top: 8.v, bottom: 8.v),
                    onTap: () {
                      onTapArrowleftone(context);
                    }),
                title: AppbarButton(margin: EdgeInsets.only(left: 102.h))),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 30.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back!",
                          style: theme.textTheme.headlineSmall),
                      SizedBox(height: 7.v),
                      Text("Be ready to use kooha_task/src in less than 2min ⚡️",
                          style: CustomTextStyles.titleSmallGray500),
                      SizedBox(height: 39.v),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email address",
                                style: CustomTextStyles.titleSmallOnError),
                            SizedBox(height: 3.v),
                            CustomTextFormField(
                                controller: emailController,
                                hintText: "justinculhane@gmailcom",
                                textInputAction: TextInputAction.done,
                                suffix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        30.h, 16.v, 16.h, 16.v),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgCheckmark)),
                                suffixConstraints:
                                    BoxConstraints(maxHeight: 56.v),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineGray)
                          ]),
                      SizedBox(height: 20.v),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Password",
                                style: CustomTextStyles.titleSmallOnError),
                            SizedBox(height: 3.v),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.h, vertical: 17.v),
                                decoration: AppDecoration.outlineGray.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(top: 3.v),
                                          child: Text("P@sW0rd234",
                                              style:
                                                  theme.textTheme.titleSmall)),
                                      Padding(
                                          padding: EdgeInsets.only(top: 2.v),
                                          child: Text("Hide",
                                              style: CustomTextStyles
                                                  .titleSmallAmberA700Medium))
                                    ]))
                          ]),
                      Spacer(),
                      CustomElevatedButton(
                          text: "Log me in",
                          margin: EdgeInsets.only(right: 42.h, bottom: 17.v),
                          buttonStyle: CustomButtonStyles.fillPrimaryTL6)
                    ]))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
