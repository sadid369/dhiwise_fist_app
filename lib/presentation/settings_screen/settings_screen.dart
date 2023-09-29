import 'bloc/settings_bloc.dart';
import 'models/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:sadid_s_application1/core/app_export.dart';
import 'package:sadid_s_application1/widgets/custom_icon_button.dart';
import 'package:sadid_s_application1/widgets/custom_outlined_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsBloc>(
        create: (context) =>
            SettingsBloc(SettingsState(settingsModelObj: SettingsModel()))
              ..add(SettingsInitialEvent()),
        child: SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.h, vertical: 43.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomIconButton(
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            padding: EdgeInsets.all(6.h),
                            onTap: () {
                              onTapBtnArrowleftone(context);
                            },
                            child: CustomImageView(
                                svgPath: ImageConstant.imgArrowleft)),
                        SizedBox(height: 90.v),
                        Text("lbl_settings".tr,
                            style: theme.textTheme.headlineMedium),
                        SizedBox(height: 9.v),
                        Text("msg_your_settings_so".tr,
                            style: theme.textTheme.labelLarge),
                        SizedBox(height: 33.v),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 28.h, vertical: 20.v),
                            decoration: AppDecoration.outlineBlack.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder14),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 1.v),
                                      child: Text("lbl_personality".tr,
                                          style: CustomTextStyles
                                              .labelLargeOnPrimary)),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgArrowright,
                                      height: 6.v,
                                      width: 3.h,
                                      margin: EdgeInsets.only(
                                          left: 91.h, top: 6.v, bottom: 6.v))
                                ])),
                        SizedBox(height: 14.v),
                        Container(
                            decoration: AppDecoration.outlineBlack900,
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 28.h, vertical: 19.v),
                                decoration: AppDecoration.outlineBlack.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder14),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(top: 2.v),
                                          child: Text("lbl_language".tr,
                                              style: CustomTextStyles
                                                  .labelLargeOnPrimary)),
                                      CustomImageView(
                                          svgPath: ImageConstant.imgArrowright,
                                          height: 6.v,
                                          width: 3.h,
                                          margin: EdgeInsets.only(
                                              left: 93.h,
                                              top: 7.v,
                                              bottom: 7.v))
                                    ]))),
                        SizedBox(height: 14.v),
                        Container(
                            decoration: AppDecoration.outlineBlack900,
                            child: GestureDetector(
                                onTap: () {
                                  onTapRowtermandcondi(context);
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 28.h, vertical: 20.v),
                                    decoration: AppDecoration.outlineBlack
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder14),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 1.v),
                                              child: Text(
                                                  "msg_terms_and_conditions".tr,
                                                  style: CustomTextStyles
                                                      .labelLargeOnPrimary)),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowright,
                                              height: 6.v,
                                              width: 3.h,
                                              margin: EdgeInsets.only(
                                                  left: 58.h,
                                                  top: 6.v,
                                                  bottom: 6.v))
                                        ])))),
                        Spacer(),
                        SizedBox(height: 63.v),
                        CustomOutlinedButton(text: "lbl_log_out".tr)
                      ]))));
    });
  }

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.
  onTapBtnArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the termsandconditionsScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the termsandconditionsScreen.
  onTapRowtermandcondi(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.termsandconditionsScreen,
    );
  }
}
