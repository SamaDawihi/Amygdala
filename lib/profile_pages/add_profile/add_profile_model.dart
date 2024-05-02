import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_profile_widget.dart' show AddProfileWidget;
import 'package:flutter/material.dart';

class AddProfileModel extends FlutterFlowModel<AddProfileWidget> {
  ///  Local state fields for this page.

  bool isMale = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Name must at least be 3 characters .long';
    }
    if (val.length > 15) {
      return 'Name can\'t exceed 15 characters';
    }
    if (!RegExp('^[a-zA-Z ]+\$').hasMatch(val)) {
      return 'Name must contain only letters';
    }
    return null;
  }

  // State field(s) for HairLengthDropDown widget.
  String? hairLengthDropDownValue;
  FormFieldController<String>? hairLengthDropDownValueController;
  // State field(s) for HirColorDropDown widget.
  String? hirColorDropDownValue;
  FormFieldController<String>? hirColorDropDownValueController;
  // State field(s) for EyesColorDropDown widget.
  String? eyesColorDropDownValue;
  FormFieldController<String>? eyesColorDropDownValueController;
  DateTime? datePicked;
  // State field(s) for EthnicityDropDown widget.
  String? ethnicityDropDownValue;
  FormFieldController<String>? ethnicityDropDownValueController;
  // State field(s) for SkinColorDropDown widget.
  String? skinColorDropDownValue;
  FormFieldController<String>? skinColorDropDownValueController;
  // State field(s) for FacialHairDropDown widget.
  String? facialHairDropDownValue;
  FormFieldController<String>? facialHairDropDownValueController;
  // Model for connectionStatus component.
  late ConnectionStatusModel connectionStatusModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    nameTextControllerValidator = _nameTextControllerValidator;
    connectionStatusModel = createModel(context, () => ConnectionStatusModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    connectionStatusModel.dispose();
  }
}
