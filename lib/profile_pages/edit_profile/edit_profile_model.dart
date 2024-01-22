import '/flutter_flow/flutter_flow_util.dart';
import '/profile_pages/form_comp/form_comp_widget.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for formComp component.
  late FormCompModel formCompModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    formCompModel = createModel(context, () => FormCompModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    formCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
