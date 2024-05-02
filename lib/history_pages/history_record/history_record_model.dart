import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'history_record_widget.dart' show HistoryRecordWidget;
import 'package:flutter/material.dart';

class HistoryRecordModel extends FlutterFlowModel<HistoryRecordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Model for connectionStatus component.
  late ConnectionStatusModel connectionStatusModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    connectionStatusModel = createModel(context, () => ConnectionStatusModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    connectionStatusModel.dispose();
  }
}
