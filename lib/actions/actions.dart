import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future<String?> checkBCIConnection(BuildContext context) async {
  String? getCortexInfoAction;
  String? getUserLoginAction;
  String? getHasAccessRightAction;

  getCortexInfoAction = await actions.aGetCortexInfo();
  if (functions.bci1GetEmotivIsInstalled(getCortexInfoAction)) {
    getUserLoginAction = await actions.bGetUserLogin();
    if (functions.bci2GetIsUserLogedIn(getHasAccessRightAction!)) {
      getHasAccessRightAction = await actions.dHasAccessRight(
        FFAppState().clientId,
        FFAppState().clientSecret,
      );
      if (functions.bci3GetHasAccessRight(getHasAccessRightAction)) {
        return 'Success';
      }

      return 'Error3: doesnt have access right set it from BCI Settings';
    } else {
      return 'Error2: NotLogedinEmotivLauncher';
    }
  } else {
    return 'Error1: EmotivLauncherIsNotInstalled';
  }
}

Future<List<String>> getAvailableHeadsets(BuildContext context) async {
  String? queredHeadsets;

  queredHeadsets = await actions.eQueryHeadset();
  return functions.bci4GetAvailableHeadsetId(queredHeadsets);
}
