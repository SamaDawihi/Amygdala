import '/flutter_flow/flutter_flow_util.dart';
import 'create_account_widget.dart' show CreateAccountWidget;
import 'package:flutter/material.dart';

class CreateAccountModel extends FlutterFlowModel<CreateAccountWidget> {
  ///  Local state fields for this page.

  String? nameErr = '';

  String? emailErr;

  String? passwordErr;

  String? repasserror;

  bool? matchpass = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'email is required';
    }

    if (!RegExp('^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'at least 6 characters';
    }
    if (val.length > 12) {
      return 'at most 12 characters';
    }
    if (!RegExp('^(?=.*\\d)(?=.*[a-zA-Z]).{6,12}\$').hasMatch(val)) {
      return 'at least one number and one character ';
    }
    return null;
  }

  // State field(s) for resetPassword widget.
  FocusNode? resetPasswordFocusNode;
  TextEditingController? resetPasswordTextController;
  late bool resetPasswordVisibility;
  String? Function(BuildContext, String?)? resetPasswordTextControllerValidator;
  String? _resetPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'at least 6 characters';
    }
    if (val.length > 12) {
      return 'at most 12 characters';
    }
    if (!RegExp('^(?=.*\\d)(?=.*[a-zA-Z]).{6,12}\$').hasMatch(val)) {
      return 'at least one number and one character ';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    resetPasswordVisibility = false;
    resetPasswordTextControllerValidator =
        _resetPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    resetPasswordFocusNode?.dispose();
    resetPasswordTextController?.dispose();
  }
}
