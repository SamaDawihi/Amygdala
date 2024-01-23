import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'session_pic_custom_widget.dart' show SessionPicCustomWidget;
import 'package:flutter/material.dart';

class SessionPicCustomModel extends FlutterFlowModel<SessionPicCustomWidget> {
  ///  Local state fields for this page.

  String output = 'output';

  String? imagePath = 'false';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Timer widget.
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Backend Call - API (Replicate Image)] action in Button widget.
  ApiCallResponse? apiResultID;
  // Stores action output result for [Backend Call - API (get image)] action in Button widget.
  ApiCallResponse? apiResultImage;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
