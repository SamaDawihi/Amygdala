import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'session_widget.dart' show SessionWidget;
import 'package:flutter/material.dart';

class SessionModel extends FlutterFlowModel<SessionWidget> {
  ///  Local state fields for this page.

  bool doneCoditionChecking = false;

  List<String> imagePath = [];
  void addToImagePath(String item) => imagePath.add(item);
  void removeFromImagePath(String item) => imagePath.remove(item);
  void removeAtIndexFromImagePath(int index) => imagePath.removeAt(index);
  void insertAtIndexInImagePath(int index, String item) =>
      imagePath.insert(index, item);
  void updateImagePathAtIndex(int index, Function(String) updateFn) =>
      imagePath[index] = updateFn(imagePath[index]);

  bool terminated = false;

  String? predictedEmotion;

  String? displayEmotion;

  String? imageApiStatus;

  String? headsetId;

  String met = 'No Object Yet';

  bool showMoreInfo = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - getPredictedEmotion] action in Session widget.
  MetStruct? metObject;
  // Stores action output result for [Backend Call - Read Document] action in Session widget.
  SessionRecord? lowAccuracySession;
  // Stores action output result for [Backend Call - API (Request image id Cors)] action in Session widget.
  ApiCallResponse? getImageIdApi;
  // Stores action output result for [Backend Call - API (Get image path CORS)] action in Session widget.
  ApiCallResponse? getImageApiCall;
  // State field(s) for Timer widget.
  int timerMilliseconds = 30000;
  String timerValue = StopWatchTimer.getDisplayTime(
    30000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  SessionRecord? session;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();
  }

  /// Action blocks.
  Future<MetStruct> getPredictedEmotion(BuildContext context) async {
    String? authorizeAction;
    MetStruct? metObject;

    authorizeAction = await actions.fAuthorize(
      FFAppState().clientId,
      FFAppState().clientSecret,
    );
    metObject = await actions.gSubscribeMet(
      functions.bci5GetCortexToken(authorizeAction),
      headsetId!,
    );
    return metObject;
  }
}
