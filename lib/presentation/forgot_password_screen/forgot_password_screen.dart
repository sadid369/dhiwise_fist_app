import 'bloc/forgot_password_bloc.dart';
import 'models/forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:sadid_s_application1/core/app_export.dart';
import 'package:sadid_s_application1/core/utils/validation_functions.dart';
import 'package:sadid_s_application1/widgets/app_bar/appbar_iconbutton.dart';
import 'package:sadid_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:sadid_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:sadid_s_application1/widgets/custom_elevated_button.dart';
import 'package:sadid_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ForgotPasswordBloc>(
        create: (context) => ForgotPasswordBloc(
            ForgotPasswordState(forgotPasswordModelObj: ForgotPasswordModel()))
          ..add(ForgotPasswordInitialEvent()),
        child: ForgotPasswordScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: 56.h,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin:
                        EdgeInsets.only(left: 32.h, top: 14.v, bottom: 17.v),
                    onTap: () {
                      onTapArrowleftone(context);
                    }),
                actions: [
                  AppbarTitle(
                      text: "lbl_forgot_password".tr,
                      margin: EdgeInsets.symmetric(
                          horizontal: 35.h, vertical: 14.v))
                ]),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 31.h, vertical: 22.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 183.v,
                              width: 262.h,
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: SizedBox(
                                            width: 245.h,
                                            child: Text(
                                                "msg_if_you_are_always".tr,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme
                                                    .textTheme.labelLarge!
                                                    .copyWith(height: 1.67)))),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: SizedBox(
                                            width: 262.h,
                                            child: Text(
                                                "msg_helping_others_means".tr,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme
                                                    .textTheme.displaySmall!
                                                    .copyWith(height: 1.29))))
                                  ])),
                          SizedBox(height: 37.v),
                          CustomImageView(
                              svgPath: ImageConstant.imgLogoGray5001121x135,
                              height: 121.v,
                              width: 135.h,
                              alignment: Alignment.center),
                          SizedBox(height: 27.v),
                          Align(
                              alignment: Alignment.center,
                              child: Text("lbl_forgot_password".tr,
                                  style: theme.textTheme.titleMedium)),
                          SizedBox(height: 45.v),
                          BlocSelector<ForgotPasswordBloc, ForgotPasswordState,
                                  TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                    controller: emailController,
                                    hintText: "lbl_your_email".tr,
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidEmail(value,
                                              isRequired: true))) {
                                        return "Please enter valid email";
                                      }
                                      return null;
                                    });
                              }),
                          Container(
                              width: 246.h,
                              margin: EdgeInsets.only(
                                  top: 19.v, right: 64.h, bottom: 7.v),
                              child: Text("msg_lorem_ipsum_dolor".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodySmall!
                                      .copyWith(height: 1.67)))
                        ]))),
            bottomNavigationBar: CustomElevatedButton(
                text: "lbl_start".tr,
                margin: EdgeInsets.only(left: 32.h, right: 32.h, bottom: 52.v),
                onTap: () {
                  onTapStart(context);
                })));
  }

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the signupScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the signupScreen.
  onTapStart(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
