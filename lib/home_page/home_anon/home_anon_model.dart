import '/components/connection_status/connection_status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_anon_widget.dart' show HomeAnonWidget;
import 'package:flutter/material.dart';

class HomeAnonModel extends FlutterFlowModel<HomeAnonWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for connectionStatus component.
  late ConnectionStatusModel connectionStatusModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    connectionStatusModel = createModel(context, () => ConnectionStatusModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    connectionStatusModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
