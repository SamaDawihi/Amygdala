import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future checkBCIConnection(BuildContext context) async {
  String? getCortexInfoAction;
  String? getUserLoginAction;
  String? getHasAccessRightAction;
  String? queryHeadsetAction;

  getCortexInfoAction = await actions.aGetCortexInfo();
  if (functions.bci1GetEmotivIsInstalled(getCortexInfoAction)) {
    getUserLoginAction = await actions.bGetUserLogin();
    if (functions.bci2GetIsUserLogedIn(getUserLoginAction)) {
      getHasAccessRightAction = await actions.dHasAccessRight(
        FFAppState().clientId,
        FFAppState().clientSecret,
      );
      if (functions.bci3GetHasAccessRight(getHasAccessRightAction)) {
        queryHeadsetAction = await actions.eQueryHeadset();
        if (functions.bci4GetAvailableHeadsetId(queryHeadsetAction).isNotEmpty) {
          FFAppState().update(() {
            FFAppState().updateConnectionStatusStruct(
              (e) => e
                ..status = 'Connected'
                ..details = 'You Can Start A Session At Any Time'
                ..availableHeadsets = functions
                    .bci4GetAvailableHeadsetId(queryHeadsetAction!)
                    .toList()
                ..lastChecked = getCurrentTimestamp
                ..condition = 4,
            );
          });
          return;
        } else {
          FFAppState().update(() {
            FFAppState().updateConnectionStatusStruct(
              (e) => e
                ..status = 'Not Connected'
                ..details =
                    'Make sure to connect the device through the Emotiv Launcher App'
                ..availableHeadsets = []
                ..lastChecked = getCurrentTimestamp
                ..condition = 3,
            );
          });
          return;
        }
      } else {
        FFAppState().update(() {
          FFAppState().updateConnectionStatusStruct(
            (e) => e
              ..status = 'No Access Right'
              ..details = 'Request Access from BCI Settings Page'
              ..availableHeadsets = []
              ..lastChecked = getCurrentTimestamp
              ..condition = 2,
          );
        });
        return;
      }
    } else {
      FFAppState().update(() {
        FFAppState().updateConnectionStatusStruct(
          (e) => e
            ..status = valueOrDefault<String>(
              'Not Logged In Emotiv Launcher',
              'Not Logged In Emotiv Launcher',
            )
            ..details = 'Log in through Emotiv Launcher app'
            ..availableHeadsets = []
            ..lastChecked = getCurrentTimestamp
            ..condition = 1,
        );
      });
      return;
    }
  } else {
    FFAppState().update(() {
      FFAppState().updateConnectionStatusStruct(
        (e) => e
          ..status = valueOrDefault<String>(
            'Emotiv Launcher Isn\'t Installed',
            'Emotiv Launcher Isn\'t Installed',
          )
          ..details = 'Install Emotiv launcher to be Able To Connect'
          ..availableHeadsets = []
          ..lastChecked = getCurrentTimestamp
          ..condition = 0,
      );
    });
    return;
  }
}
