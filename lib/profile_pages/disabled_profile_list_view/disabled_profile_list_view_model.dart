import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'disabled_profile_list_view_widget.dart'
    show DisabledProfileListViewWidget;
import 'package:flutter/material.dart';

class DisabledProfileListViewModel
    extends FlutterFlowModel<DisabledProfileListViewWidget> {
  ///  Local state fields for this component.

  int deleteSessionsLoop = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SessionRecord? sessionId;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<SessionRecord>? sessionsToBeDeleted;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
