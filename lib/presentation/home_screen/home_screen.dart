import 'bloc/home_bloc.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:sadid_s_application1/core/app_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(HomeState(homeModelObj: HomeModel()))
          ..add(HomeInitialEvent()),
        child: HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 30.h, top: 79.v, right: 30.h),
                  child: Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgProfileimage,
                        height: 139.adaptSize,
                        width: 139.adaptSize,
                        radius: BorderRadius.circular(69.h),
                        onTap: () {
                          onTapImgProfileimage(context);
                        }),
                    SizedBox(height: 13.v),
                    Text("lbl_adalah".tr, style: theme.textTheme.titleLarge),
                    Text("lbl_alcanasatre".tr,
                        style: theme.textTheme.bodyLarge),
                    SizedBox(height: 15.v),
                    Text("msg_joined_6_month_ago".tr,
                        style: CustomTextStyles.bodySmallOnPrimary),
                    GestureDetector(
                        onTap: () {
                          onTapPersonality(context);
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 47.v),
                            padding: EdgeInsets.symmetric(
                                horizontal: 28.h, vertical: 16.v),
                            decoration: AppDecoration.fillSecondaryContainer
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder14),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgLocation,
                                      height: 18.v,
                                      width: 20.h,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 4.v)),
                                  Spacer(flex: 45),
                                  Padding(
                                      padding: EdgeInsets.only(top: 3.v),
                                      child: Text("lbl_personality".tr,
                                          style: CustomTextStyles
                                              .titleMediumSecondaryContainer)),
                                  Spacer(flex: 54),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgStroke1,
                                      height: 6.v,
                                      width: 5.h,
                                      radius: BorderRadius.circular(2.h),
                                      margin: EdgeInsets.only(
                                          top: 10.v, right: 5.h, bottom: 10.v))
                                ]))),
                    Container(
                        margin: EdgeInsets.only(top: 13.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 28.h, vertical: 16.v),
                        decoration: AppDecoration.fillDeepPurpleA.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder14),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgFile,
                                  height: 20.v,
                                  width: 17.h,
                                  margin: EdgeInsets.only(
                                      left: 3.h, top: 3.v, bottom: 3.v)),
                              Spacer(flex: 43),
                              Padding(
                                  padding: EdgeInsets.only(top: 3.v),
                                  child: Text("lbl_work_today_s".tr,
                                      style: CustomTextStyles
                                          .titleMediumDeeppurpleA400)),
                              Spacer(flex: 56),
                              CustomImageView(
                                  svgPath:
                                      ImageConstant.imgStroke1DeepPurpleA400,
                                  height: 6.v,
                                  width: 5.h,
                                  radius: BorderRadius.circular(2.h),
                                  margin: EdgeInsets.symmetric(vertical: 10.v))
                            ])),
                    Container(
                        margin: EdgeInsets.only(top: 13.v, bottom: 5.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 26.h, vertical: 15.v),
                        decoration: AppDecoration.fillPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder14),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgSettings,
                                  height: 20.v,
                                  width: 19.h,
                                  margin: EdgeInsets.only(
                                      left: 3.h, top: 4.v, bottom: 4.v)),
                              Spacer(flex: 45),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.v),
                                  child: Text("lbl_setting".tr,
                                      style:
                                          CustomTextStyles.titleMediumPrimary)),
                              Spacer(flex: 54),
                              CustomImageView(
                                  svgPath: ImageConstant.imgStroke1Primary,
                                  height: 6.v,
                                  width: 5.h,
                                  radius: BorderRadius.circular(2.h),
                                  margin: EdgeInsets.symmetric(vertical: 11.v))
                            ]))
                  ]))));
    });
  }

  /// Requests permission to access the camera and storage, and displays a model
  /// sheet for selecting images.
  ///
  /// Throws an error if permission is denied or an error occurs while selecting images.
  onTapImgProfileimage(BuildContext context) async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }

  /// Navigates to the personalityScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the personalityScreen.
  onTapPersonality(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.personalityScreen,
    );
  }
}
