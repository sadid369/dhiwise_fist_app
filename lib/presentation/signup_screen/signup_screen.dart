import 'bloc/signup_bloc.dart';
import 'models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:sadid_s_application1/core/app_export.dart';
import 'package:sadid_s_application1/core/utils/validation_functions.dart';
import 'package:sadid_s_application1/widgets/app_bar/appbar_iconbutton.dart';
import 'package:sadid_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:sadid_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:sadid_s_application1/widgets/custom_elevated_button.dart';
import 'package:sadid_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupBloc>(
        create: (context) =>
            SignupBloc(SignupState(signupModelObj: SignupModel()))
              ..add(SignupInitialEvent()),
        child: SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray5001,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: 52.h,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin:
                        EdgeInsets.only(left: 28.h, top: 14.v, bottom: 17.v),
                    onTap: () {
                      onTapArrowleftone(context);
                    }),
                actions: [
                  AppbarTitle(
                      text: "lbl_sign_up".tr,
                      margin: EdgeInsets.symmetric(
                          horizontal: 45.h, vertical: 14.v))
                ]),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 27.v),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 28.h, right: 32.h, bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 218.h,
                                  child: Text("msg_when_community_comes".tr,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.displaySmall!
                                          .copyWith(height: 1.18))),
                              Container(
                                  width: 245.h,
                                  margin: EdgeInsets.only(right: 69.h),
                                  child: Text("msg_our_community_is2".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles.bodySmallBlack900
                                          .copyWith(height: 1.67))),
                              SizedBox(height: 12.v),
                              CustomImageView(
                                  svgPath: ImageConstant.imgLogoGray5001120x114,
                                  height: 120.v,
                                  width: 114.h,
                                  alignment: Alignment.center),
                              SizedBox(height: 96.v),
                              BlocSelector<SignupBloc, SignupState,
                                      TextEditingController?>(
                                  selector: (state) =>
                                      state.firstNameController,
                                  builder: (context, firstNameController) {
                                    return CustomTextFormField(
                                        controller: firstNameController,
                                        hintText: "lbl_first_name".tr,
                                        validator: (value) {
                                          if (!isText(value)) {
                                            return "Please enter valid text";
                                          }
                                          return null;
                                        });
                                  }),
                              SizedBox(height: 24.v),
                              BlocSelector<SignupBloc, SignupState,
                                      TextEditingController?>(
                                  selector: (state) => state.lastNameController,
                                  builder: (context, lastNameController) {
                                    return CustomTextFormField(
                                        controller: lastNameController,
                                        hintText: "lbl_last_name".tr,
                                        validator: (value) {
                                          if (!isText(value)) {
                                            return "Please enter valid text";
                                          }
                                          return null;
                                        });
                                  }),
                              SizedBox(height: 24.v),
                              BlocSelector<SignupBloc, SignupState,
                                      TextEditingController?>(
                                  selector: (state) => state.emailController,
                                  builder: (context, emailController) {
                                    return CustomTextFormField(
                                        controller: emailController,
                                        hintText: "lbl_e_mail".tr,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidEmail(value,
                                                  isRequired: true))) {
                                            return "Please enter valid email";
                                          }
                                          return null;
                                        });
                                  }),
                              SizedBox(height: 24.v),
                              BlocSelector<SignupBloc, SignupState,
                                      TextEditingController?>(
                                  selector: (state) => state.passwordController,
                                  builder: (context, passwordController) {
                                    return CustomTextFormField(
                                        controller: passwordController,
                                        hintText: "lbl_password".tr,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidPassword(value,
                                                  isRequired: true))) {
                                            return "Please enter valid password";
                                          }
                                          return null;
                                        },
                                        obscureText: true);
                                  }),
                              Container(
                                  width: 248.h,
                                  margin:
                                      EdgeInsets.only(top: 22.v, right: 65.h),
                                  child: Text("msg_lorem_ipsum_dolor".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.labelLarge!
                                          .copyWith(height: 1.67))),
                              CustomElevatedButton(
                                  text: "lbl_next".tr,
                                  margin:
                                      EdgeInsets.only(left: 4.h, top: 30.v)),
                              SizedBox(height: 29.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapAlreadyhavean(context);
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("msg_already_have_an".tr,
                                                style:
                                                    theme.textTheme.labelLarge),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.h),
                                                child: Text("lbl_login".tr,
                                                    style: CustomTextStyles
                                                        .labelLargeSecondaryContainerSemiBold))
                                          ])))
                            ]))))));
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

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the loginScreen.
  onTapAlreadyhavean(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
