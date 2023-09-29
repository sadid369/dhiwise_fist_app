import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:sadid_s_application1/presentation/personality_screen/models/personality_model.dart';
import 'package:sadid_s_application1/data/models/me/get_me_resp.dart';
import 'dart:async';
import 'package:sadid_s_application1/data/repository/repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'personality_event.dart';
part 'personality_state.dart';

/// A bloc that manages the state of a Personality according to the event that is dispatched to it.
class PersonalityBloc extends Bloc<PersonalityEvent, PersonalityState> {
  PersonalityBloc(PersonalityState initialState) : super(initialState) {
    on<PersonalityInitialEvent>(_onInitialize);
    on<FetchMeEvent>(_callFetchMe);
  }

  final _repository = Repository();

  var getMeResp = GetMeResp();

  /// Calls the https://nodedemo.dhiwise.co/device/api/v1/user/me API and triggers a [FetchMeEvent] event on the [PersonalityBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  _onInitialize(
    PersonalityInitialEvent event,
    Emitter<PersonalityState> emit,
  ) async {
    emit(state.copyWith(
        userNameController: TextEditingController(),
        firstNameController: TextEditingController(),
        lastNameController: TextEditingController(),
        hobbytwoController: TextEditingController(),
        dateOfBirthController: TextEditingController(),
        countryController: TextEditingController()));
    add(
      FetchMeEvent(
        onFetchMeEventError: () {
          _onFetchMeEventError();
        },
      ),
    );
  }

  /// Calls [https://nodedemo.dhiwise.co/device/api/v1/user/me] with the provided event and emits the state.
  ///
  /// The [FetchMeEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callFetchMe(
    FetchMeEvent event,
    Emitter<PersonalityState> emit,
  ) async {
    await _repository.fetchMe(
      headers: {
        'Content-type': 'application/json',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxNmZiNzBhZWJiM2RiYjVlYmVkYTBmMiIsInVzZXJuYW1lIjoiT3Jpb24xNyIsImlhdCI6MTY3ODc3NjY2OX0.16TzzeJMkGbsT-hk-wigjBt4xeJNcwNzVvnl05evYUk',
      },
    ).then((value) async {
      getMeResp = value;
      _onFetchMeSuccess(value, emit);
    }).onError((error, stackTrace) {
      //implement error call
      _onFetchMeError();
      event.onFetchMeEventError?.call();
    });
  }

  void _onFetchMeSuccess(
    GetMeResp resp,
    Emitter<PersonalityState> emit,
  ) {
    emit(
      state.copyWith(
        personalityModelObj: state.personalityModelObj?.copyWith(),
        userNameController:
            TextEditingController(text: resp.data!.email! ?? ''),
        firstNameController:
            TextEditingController(text: resp.data!.name! ?? ''),
      ),
    );
  }

  void _onFetchMeError() {
    //implement error method body...
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onFetchMeEventError() {
    Fluttertoast.showToast(msg: getMeResp.message.toString() ?? '');
  }
}
