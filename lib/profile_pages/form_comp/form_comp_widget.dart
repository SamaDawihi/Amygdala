import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'form_comp_model.dart';
export 'form_comp_model.dart';

class FormCompWidget extends StatefulWidget {
  const FormCompWidget({super.key});

  @override
  _FormCompWidgetState createState() => _FormCompWidgetState();
}

class _FormCompWidgetState extends State<FormCompWidget> {
  late FormCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormCompModel());

    _model.emailAddressController1 ??= TextEditingController();
    _model.emailAddressFocusNode1 ??= FocusNode();

    _model.emailAddressController2 ??= TextEditingController();
    _model.emailAddressFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 50.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name*',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    controller: _model.emailAddressController1,
                    focusNode: _model.emailAddressFocusNode1,
                    autofocus: true,
                    autofillHints: const [AutofillHints.email],
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: const Color(0xFF57636C),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFE0E3E7),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF4B39EF),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFFF5963),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFFF5963),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      contentPadding: const EdgeInsets.all(24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: const Color(0xFF101213),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                    keyboardType: TextInputType.emailAddress,
                    validator: _model.emailAddressController1Validator
                        .asValidator(context),
                  ),
                ),
              ),
              Text(
                'Age',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                    ),
              ),
              FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController1 ??=
                    FormFieldController<String>(null),
                options: const [
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '6',
                  '7',
                  '8',
                  '9',
                  '10',
                  '11',
                  '12',
                  '13',
                  '14',
                  '15',
                  '16',
                  '17',
                  '18',
                  '19',
                  '20',
                  '21',
                  '22',
                  '23',
                  '24',
                  '25',
                  '26',
                  '27',
                  '28',
                  '29',
                  '30',
                  '31',
                  '32',
                  '33',
                  '34',
                  '35',
                  '36',
                  '37',
                  '38',
                  '39',
                  '40',
                  '41',
                  '42',
                  '43',
                  '44',
                  '45',
                  '46',
                  '47',
                  '48',
                  '49',
                  '50',
                  '51',
                  '52',
                  '53',
                  '54',
                  '55',
                  '56',
                  '57',
                  '58',
                  '59',
                  '60',
                  '61',
                  '62',
                  '63',
                  '64',
                  '65',
                  '66',
                  '67',
                  '68',
                  '69',
                  '70',
                  '71',
                  '72',
                  '73',
                  '74',
                  '75',
                  '76',
                  '77',
                  '78',
                  '79',
                  '80',
                  '81',
                  '82',
                  '83',
                  '84',
                  '85',
                  '86',
                  '87',
                  '88',
                  '89',
                  '90',
                  '91',
                  '92',
                  '93',
                  '94',
                  '95',
                  '96',
                  '97',
                  '98',
                  '99'
                ],
                onChanged: (val) => setState(() => _model.dropDownValue1 = val),
                width: 300.0,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: 'Please select...',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 2.0,
                borderRadius: 8.0,
                margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
              Text(
                'Hair Color',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                    ),
              ),
              FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController2 ??=
                    FormFieldController<String>(
                  _model.dropDownValue2 ??= '1',
                ),
                options:
                    List<String>.from(['Option 1', '1', '2', '3', '4', '5']),
                optionLabels: const [
                  'Black',
                  'Brown',
                  'Red',
                  'Grey',
                  'White',
                  'Blonde'
                ],
                onChanged: (val) => setState(() => _model.dropDownValue2 = val),
                width: 300.0,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: 'Please select...',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 2.0,
                borderRadius: 8.0,
                margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
              Text(
                'Eyes color',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                    ),
              ),
              FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController3 ??=
                    FormFieldController<String>(
                  _model.dropDownValue3 ??= '1',
                ),
                options: List<String>.from(
                    ['Option 1', '1', '2', '3', '4', '5', '6']),
                optionLabels: const [
                  'Brown',
                  'Blue',
                  'Green',
                  'Hazel',
                  'Gray',
                  'Amber',
                  'Black'
                ],
                onChanged: (val) => setState(() => _model.dropDownValue3 = val),
                width: 300.0,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: 'Please select...',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 2.0,
                borderRadius: 8.0,
                margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last Name',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    controller: _model.emailAddressController2,
                    focusNode: _model.emailAddressFocusNode2,
                    autofocus: true,
                    autofillHints: const [AutofillHints.email],
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: const Color(0xFF57636C),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFE0E3E7),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF4B39EF),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFFF5963),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFFF5963),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      contentPadding: const EdgeInsets.all(24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: const Color(0xFF101213),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                    keyboardType: TextInputType.emailAddress,
                    validator: _model.emailAddressController2Validator
                        .asValidator(context),
                  ),
                ),
              ),
              Text(
                'Ethnicity',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                    ),
              ),
              FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController4 ??=
                    FormFieldController<String>(
                  _model.dropDownValue4 ??= 'Gulf Arab',
                ),
                options: List<String>.from([
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
                ]),
                optionLabels: const [
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
                onChanged: (val) => setState(() => _model.dropDownValue4 = val),
                width: 300.0,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: 'Please select...',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 2.0,
                borderRadius: 8.0,
                margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
              Text(
                'Skin Color',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                    ),
              ),
              FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController5 ??=
                    FormFieldController<String>(
                  _model.dropDownValue5 ??= '5',
                ),
                options: List<String>.from(
                    ['Option 1', '1', '2', '3', '4', '5', '6', '7', '8', '9']),
                optionLabels: const [
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
                onChanged: (val) => setState(() => _model.dropDownValue5 = val),
                width: 300.0,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: 'Please select...',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 2.0,
                borderRadius: 8.0,
                margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
              Text(
                'Facial Hair',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                    ),
              ),
              FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController6 ??=
                    FormFieldController<String>(
                  _model.dropDownValue6 ??= '',
                ),
                options: List<String>.from(['Option 1', '1', '2', '3', '4']),
                optionLabels: const [
                  'No facial hair',
                  'Stubble facial hair',
                  'Beard',
                  'Beard and Mustache',
                  'Mustache'
                ],
                onChanged: (val) => setState(() => _model.dropDownValue6 = val),
                width: 300.0,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: 'Please select...',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 2.0,
                borderRadius: 8.0,
                margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ],
    );
  }
}
