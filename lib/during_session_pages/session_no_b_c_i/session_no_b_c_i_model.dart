import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'session_no_b_c_i_widget.dart' show SessionNoBCIWidget;
import 'package:flutter/material.dart';

class SessionNoBCIModel extends FlutterFlowModel<SessionNoBCIWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Replicate Image)] action in SessionNoBCI widget.
  ApiCallResponse? getImageIdApi;
  // Stores action output result for [Backend Call - API (get image)] action in SessionNoBCI widget.
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();
  }

  /// Action blocks are added here.

  Future getPredictedEmotion(BuildContext context) async {}

  /// Additional helper methods are added here.
}
