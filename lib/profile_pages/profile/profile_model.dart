import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  int deleteSessionsLoop = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<SessionRecord>? sessionsToBeDeleted;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (Request image id Cors)] action in IconButton widget.
  ApiCallResponse? imageIdAPI;
  // Stores action output result for [Backend Call - API (Get image path CORS)] action in IconButton widget.
  ApiCallResponse? imagePathAPI;
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
