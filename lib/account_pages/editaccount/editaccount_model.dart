import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editaccount_widget.dart' show EditaccountWidget;
import 'package:flutter/material.dart';

class EditaccountModel extends FlutterFlowModel<EditaccountWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.isEmpty) {
      return 'this field cannot be empty.';
    }
    if (val.length > 30) {
      return 'the maximum length is 30 characters.';
    }

    return null;
  }

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'It should be a valid email!';
    }
    return null;
  }

  // Stores action output result for [Custom Action - isEmailUnique] action in Button widget.
  bool? emailUnique;
  // Model for connectionStatus component.
  late ConnectionStatusModel connectionStatusModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    nameTextControllerValidator = _nameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    connectionStatusModel = createModel(context, () => ConnectionStatusModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    connectionStatusModel.dispose();
  }
}
