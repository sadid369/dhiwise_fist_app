import 'bloc/termsandconditions_bloc.dart';
import 'models/termsandconditions_model.dart';
import 'package:flutter/material.dart';
import 'package:sadid_s_application1/core/app_export.dart';
import 'package:sadid_s_application1/widgets/custom_icon_button.dart';

class TermsandconditionsScreen extends StatelessWidget {
  const TermsandconditionsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<TermsandconditionsBloc>(
        create: (context) => TermsandconditionsBloc(TermsandconditionsState(
            termsandconditionsModelObj: TermsandconditionsModel()))
          ..add(TermsandconditionsInitialEvent()),
        child: TermsandconditionsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<TermsandconditionsBloc, TermsandconditionsState>(
        builder: (context, state) {
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
                        SizedBox(height: 79.v),
                        SizedBox(
                            width: 155.h,
                            child: Text("msg_terms_and_conditions".tr,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.headlineMedium!
                                    .copyWith(height: 1.36))),
                        Container(
                            width: 285.h,
                            margin: EdgeInsets.only(
                                top: 63.v, right: 25.h, bottom: 7.v),
                            child: Text("msg_lorem_ipsum_dolor2".tr,
                                maxLines: 20,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.bodySmallOnPrimary_1
                                    .copyWith(height: 2.00)))
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
}
