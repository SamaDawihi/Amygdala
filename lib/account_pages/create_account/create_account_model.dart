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
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
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
  TextEditingController? resetPasswordController;
  late bool resetPasswordVisibility;
  String? Function(BuildContext, String?)? resetPasswordControllerValidator;
  String? _resetPasswordControllerValidator(BuildContext context, String? val) {
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailAddressControllerValidator = _emailAddressControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    resetPasswordVisibility = false;
    resetPasswordControllerValidator = _resetPasswordControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    resetPasswordFocusNode?.dispose();
    resetPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
