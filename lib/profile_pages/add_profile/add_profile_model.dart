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
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
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
    nameFocusNode?.dispose();
    nameController?.dispose();

    connectionStatusModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
