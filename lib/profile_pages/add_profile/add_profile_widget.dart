import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'add_profile_model.dart';
export 'add_profile_model.dart';

class AddProfileWidget extends StatefulWidget {
  const AddProfileWidget({super.key});

  @override
  State<AddProfileWidget> createState() => _AddProfileWidgetState();
}

class _AddProfileWidgetState extends State<AddProfileWidget> {
  late AddProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddProfileModel());

    _model.nameController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Home',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [
            Container(
              decoration: const BoxDecoration(),
              child: Container(
                width: 300.0,
                decoration: const BoxDecoration(),
                child: wrapWithModel(
                  model: _model.connectionStatusModel,
                  updateCallback: () => setState(() {}),
                  child: const ConnectionStatusWidget(),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.sideNavModel,
                updateCallback: () => setState(() {}),
                child: const SideNavWidget(
                  currentPage: 1,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: GradientText(
                              'Tell Us More',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 30.0,
                                  ),
                              colors: const [Color(0xFF1D1753), Color(0xFF4036A4)],
                              gradientType: GradientType.radial,
                              radius: 1.0,
                            ),
                          ),
                          GradientText(
                            'By giving us more information about the person whom emotions will be \ntranslated, we will optimize the Generated Art to match his/her real looks',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w300,
                                ),
                            colors: const [Color(0xFF1D1753), Color(0xFF4036A4)],
                            gradientType: GradientType.radial,
                            radius: 1.0,
                          ),
                        ].divide(const SizedBox(height: 5.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.isMale = false;
                              });
                            },
                            child: Container(
                              width: 120.0,
                              constraints: const BoxConstraints(
                                minWidth: 100.0,
                                minHeight: 100.0,
                                maxWidth: 100.0,
                                maxHeight: 100.0,
                              ),
                              decoration: BoxDecoration(
                                color: !_model.isMale
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.female_outlined,
                                    color: _model.isMale
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    size: 36.0,
                                  ),
                                  Text(
                                    'Female',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: valueOrDefault<Color>(
                                            _model.isMale
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.isMale = true;
                              });
                            },
                            child: Container(
                              width: 120.0,
                              constraints: const BoxConstraints(
                                minWidth: 100.0,
                                minHeight: 100.0,
                                maxWidth: 100.0,
                                maxHeight: 100.0,
                              ),
                              decoration: BoxDecoration(
                                color: _model.isMale
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.male_rounded,
                                    color: !_model.isMale
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    size: 36.0,
                                  ),
                                  Text(
                                    'Male',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: !_model.isMale
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 50.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name*',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                              SizedBox(
                                width: 300.0,
                                child: TextFormField(
                                  controller: _model.nameController,
                                  focusNode: _model.nameFocusNode,
                                  autofocus: true,
                                  autofillHints: const [AutofillHints.name],
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Enter Name',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: const Color(0xFF57636C),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    contentPadding: const EdgeInsets.all(24.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  keyboardType: TextInputType.name,
                                  validator: _model.nameControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Text(
                                'Hair Length',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.hairLengthDropDownValueController ??=
                                        FormFieldController<String>(
                                  _model.hairLengthDropDownValue ??= 'Medium',
                                ),
                                options: const [
                                  'Bald',
                                  'Very Short',
                                  'Short',
                                  'Medium',
                                  'long',
                                  'Very Long'
                                ],
                                onChanged: (val) => setState(
                                    () => _model.hairLengthDropDownValue = val),
                                width: 300.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Hair Length',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                              Text(
                                'Hair Color',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.hirColorDropDownValueController ??=
                                        FormFieldController<String>(
                                  _model.hirColorDropDownValue ??= 'Black',
                                ),
                                options: const [
                                  'Black',
                                  'Brown',
                                  'Red',
                                  'Grey',
                                  'White',
                                  'Blonde'
                                ],
                                onChanged: (val) => setState(
                                    () => _model.hirColorDropDownValue = val),
                                width: 300.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Hair Color',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                              Text(
                                'Eyes color',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.eyesColorDropDownValueController ??=
                                        FormFieldController<String>(
                                  _model.eyesColorDropDownValue ??= 'Black',
                                ),
                                options: const [
                                  'Brown',
                                  'Blue',
                                  'Green',
                                  'Hazel',
                                  'Gray',
                                  'Amber',
                                  'Black'
                                ],
                                onChanged: (val) => setState(
                                    () => _model.eyesColorDropDownValue = val),
                                width: 300.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Eyes Color',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                              Container(
                                width: 200.0,
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Birthday',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  final datePickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: DateTime(1900),
                                    lastDate: getCurrentTimestamp,
                                    builder: (context, child) {
                                      return wrapInMaterialDatePickerTheme(
                                        context,
                                        child!,
                                        headerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        headerForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        headerTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 32.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                        pickerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        pickerForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        selectedDateTimeBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        selectedDateTimeForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        actionButtonForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        iconSize: 24.0,
                                      );
                                    },
                                  );

                                  if (datePickedDate != null) {
                                    safeSetState(() {
                                      _model.datePicked = DateTime(
                                        datePickedDate.year,
                                        datePickedDate.month,
                                        datePickedDate.day,
                                      );
                                    });
                                  }
                                },
                                text:
                                    dateTimeFormat('d/M/y', _model.datePicked),
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 50.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Text(
                                'Ethnicity',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.ethnicityDropDownValueController ??=
                                        FormFieldController<String>(
                                  _model.ethnicityDropDownValue ??= 'Gulf Arab',
                                ),
                                options: const [
                                  'Gulf Arab',
                                  'Egyptian Arab',
                                  'Iraqi Arab',
                                  'Levantine Arab',
                                  'Maghreb Arab',
                                  'Japanese',
                                  'Russian',
                                  'Punjabi',
                                  'German',
                                  'French',
                                  'Italian',
                                  'Kurdish',
                                  'Korean',
                                  'Yoruba',
                                  'Polish',
                                  'Thai',
                                  'Ukrainian',
                                  'Somali',
                                  'Turkish',
                                  'Serb',
                                  'Irish',
                                  'Romanian',
                                  'Maldivian',
                                  'Sami'
                                ],
                                onChanged: (val) => setState(
                                    () => _model.ethnicityDropDownValue = val),
                                width: 300.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Ethnicity',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                              Text(
                                'Skin Color',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.skinColorDropDownValueController ??=
                                        FormFieldController<String>(
                                  _model.skinColorDropDownValue ??=
                                      'Medium Olive Skin',
                                ),
                                options: const [
                                  'Very Fair Skin',
                                  'Fair Skin',
                                  'Light Olive Skin',
                                  'Medium Olive Skin',
                                  'Light Tan Skin',
                                  'Medium Tan Skin',
                                  'Dark Tan Skin',
                                  'Light Brown Skin',
                                  'Medium Brown Skin',
                                  'Dark Brown to Black Skin'
                                ],
                                onChanged: (val) => setState(
                                    () => _model.skinColorDropDownValue = val),
                                width: 300.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Skin Color',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                              Text(
                                'Facial Hair',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.facialHairDropDownValueController ??=
                                        FormFieldController<String>(
                                  _model.facialHairDropDownValue ??= 'None',
                                ),
                                options: const [
                                  'None',
                                  'Subtle',
                                  'Beard',
                                  'Beard and Mustache',
                                  'Mustache'
                                ],
                                onChanged: (val) => setState(
                                    () => _model.facialHairDropDownValue = val),
                                width: 300.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Facial Hair',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                              Container(
                                width: 200.0,
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ],
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          await DisabledProfileRecord.collection
                              .doc()
                              .set(createDisabledProfileRecordData(
                                caregiverID: currentUserReference,
                                isMale: _model.isMale,
                                ethnicity: _model.ethnicityDropDownValue,
                                hairColor: _model.hirColorDropDownValue,
                                skinColor: _model.skinColorDropDownValue,
                                facialHair: _model.facialHairDropDownValue,
                                name: _model.nameController.text,
                                birthday: _model.datePicked,
                                eyesColor: _model.eyesColorDropDownValue,
                                hairLength: _model.hairLengthDropDownValue,
                              ));

                          context.pushNamed('Home');
                        },
                        text: 'Add Profile',
                        icon: Icon(
                          Icons.face,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 48.0,
                          padding: const EdgeInsets.all(0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 4.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 20.0))
                        .addToStart(const SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
