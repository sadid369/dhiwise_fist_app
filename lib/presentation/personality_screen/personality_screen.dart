import 'bloc/personality_bloc.dart';
import 'models/personality_model.dart';
import 'package:flutter/material.dart';
import 'package:sadid_s_application1/core/app_export.dart';
import 'package:sadid_s_application1/widgets/app_bar/appbar_iconbutton.dart';
import 'package:sadid_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:sadid_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:sadid_s_application1/widgets/custom_elevated_button.dart';
import 'package:sadid_s_application1/widgets/custom_text_form_field.dart';

class PersonalityScreen extends StatelessWidget {
  const PersonalityScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PersonalityBloc>(
        create: (context) => PersonalityBloc(
            PersonalityState(personalityModelObj: PersonalityModel()))
          ..add(PersonalityInitialEvent()),
        child: PersonalityScreen());
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
                      text: "lbl_personality".tr,
                      margin: EdgeInsets.symmetric(
                          horizontal: 32.h, vertical: 14.v))
                ]),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 19.v),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 32.h, right: 32.h, bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgProfileimage,
                                  height: 139.adaptSize,
                                  width: 139.adaptSize,
                                  radius: BorderRadius.circular(69.h),
                                  alignment: Alignment.center,
                                  onTap: () {
                                    onTapImgProfileimage(context);
                                  }),
                              SizedBox(height: 18.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: Opacity(
                                      opacity: 0.8,
                                      child: Text("lbl_edit_photo".tr,
                                          style: CustomTextStyles
                                              .labelLargeSecondaryContainer_1))),
                              SizedBox(height: 50.v),
                              Text("lbl_username".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 13.v),
                              BlocSelector<PersonalityBloc, PersonalityState,
                                      TextEditingController?>(
                                  selector: (state) => state.userNameController,
                                  builder: (context, userNameController) {
                                    return CustomTextFormField(
                                        controller: userNameController,
                                        hintText: "lbl_adalahalcana".tr,
                                        hintStyle: CustomTextStyles
                                            .titleSmallOnPrimary_1);
                                  }),
                              SizedBox(height: 18.v),
                              Text("lbl_first_name2".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 13.v),
                              BlocSelector<PersonalityBloc, PersonalityState,
                                      TextEditingController?>(
                                  selector: (state) =>
                                      state.firstNameController,
                                  builder: (context, firstNameController) {
                                    return CustomTextFormField(
                                        controller: firstNameController,
                                        hintText: "lbl_alcanasatre".tr,
                                        hintStyle: CustomTextStyles
                                            .titleSmallOnPrimary_1);
                                  }),
                              SizedBox(height: 18.v),
                              Text("lbl_last_name2".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 13.v),
                              BlocSelector<PersonalityBloc, PersonalityState,
                                      TextEditingController?>(
                                  selector: (state) => state.lastNameController,
                                  builder: (context, lastNameController) {
                                    return CustomTextFormField(
                                        controller: lastNameController,
                                        hintText: "lbl_fourta".tr,
                                        hintStyle: CustomTextStyles
                                            .titleSmallOnPrimary_1);
                                  }),
                              SizedBox(height: 20.v),
                              Text("lbl_hobby".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 11.v),
                              BlocSelector<PersonalityBloc, PersonalityState,
                                      TextEditingController?>(
                                  selector: (state) => state.hobbytwoController,
                                  builder: (context, hobbytwoController) {
                                    return CustomTextFormField(
                                        controller: hobbytwoController,
                                        hintText: "lbl_sleep".tr,
                                        hintStyle: CustomTextStyles
                                            .titleSmallOnPrimary_1);
                                  }),
                              SizedBox(height: 18.v),
                              Text("lbl_date_of_birth".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 13.v),
                              BlocSelector<PersonalityBloc, PersonalityState,
                                      TextEditingController?>(
                                  selector: (state) =>
                                      state.dateOfBirthController,
                                  builder: (context, dateOfBirthController) {
                                    return CustomTextFormField(
                                        controller: dateOfBirthController,
                                        hintText: "lbl_28_may_2002".tr,
                                        hintStyle: CustomTextStyles
                                            .titleSmallOnPrimary_1);
                                  }),
                              SizedBox(height: 20.v),
                              Text("lbl_country".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 11.v),
                              BlocSelector<PersonalityBloc, PersonalityState,
                                      TextEditingController?>(
                                  selector: (state) => state.countryController,
                                  builder: (context, countryController) {
                                    return CustomTextFormField(
                                        controller: countryController,
                                        hintText: "lbl_indonesian".tr,
                                        hintStyle: CustomTextStyles
                                            .titleSmallOnPrimary_1,
                                        textInputAction: TextInputAction.done);
                                  }),
                              SizedBox(height: 34.v),
                              CustomElevatedButton(
                                  text: "lbl_change_save".tr,
                                  buttonTextStyle:
                                      CustomTextStyles.titleMediumWhiteA700,
                                  onTap: () {
                                    onTapChangesave(context);
                                  })
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

  /// Navigates to the workTodayScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the workTodayScreen.
  onTapChangesave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.workTodayScreen,
    );
  }
}
