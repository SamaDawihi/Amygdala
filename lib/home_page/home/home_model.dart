import '/backend/backend.dart';
import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DisabledProfileRecord? disabledprofileExist;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SessionRecord? sessionCreated;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DisabledProfileRecord? queredDisabled;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SessionRecord? sessionId;
  // Model for connectionStatus component.
  late ConnectionStatusModel connectionStatusModel;

  /// Initialization and disposal methods.

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

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
