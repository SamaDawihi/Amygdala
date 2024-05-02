import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'normal_proxy_widget.dart' show NormalProxyWidget;
import 'package:flutter/material.dart';

class NormalProxyModel extends FlutterFlowModel<NormalProxyWidget> {
  ///  Local state fields for this page.

  String image =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/eep0xg5cq6pa/Screenshot_2023-11-28_150737.png';

  String result = 'no Id Yet';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - postImage] action in Button widget.
  ImageResultStruct? getImageAction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
