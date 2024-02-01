import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/history_pages/emo_filter/emo_filter_widget.dart';
import '/history_pages/session_record/session_record_widget.dart';
import 'history_widget.dart' show HistoryWidget;
import 'package:flutter/material.dart';

class HistoryModel extends FlutterFlowModel<HistoryWidget> {
  ///  Local state fields for this page.

  int filter = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Model for emoFilter component.
  late EmoFilterModel emoFilterModel;
  // Models for SessionRecord dynamic component.
  late FlutterFlowDynamicModels<SessionRecordModel> sessionRecordModels;
  // Model for connectionStatus component.
  late ConnectionStatusModel connectionStatusModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    emoFilterModel = createModel(context, () => EmoFilterModel());
    sessionRecordModels = FlutterFlowDynamicModels(() => SessionRecordModel());
    connectionStatusModel = createModel(context, () => ConnectionStatusModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    emoFilterModel.dispose();
    sessionRecordModels.dispose();
    connectionStatusModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
