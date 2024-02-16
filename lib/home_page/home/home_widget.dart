import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

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
              child: SizedBox(
                width: 200.0,
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
                child: const SideNavWidget(),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        _model.disabledprofileExist =
                            await queryDisabledProfileRecordOnce(
                          queryBuilder: (disabledProfileRecord) =>
                              disabledProfileRecord.where(
                            'caregiverID',
                            isEqualTo: currentUserReference,
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        if (_model.disabledprofileExist?.reference != null) {
                          var sessionRecordReference =
                              SessionRecord.collection.doc();
                          await sessionRecordReference.set({
                            ...createSessionRecordData(
                              happy: 0,
                              sad: 0,
                              angry: 0,
                              natural: 0,
                              relaxed: 0,
                            ),
                            ...mapToFirestore(
                              {
                                'startAt': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                          _model.sessionCreated =
                              SessionRecord.getDocumentFromData({
                            ...createSessionRecordData(
                              happy: 0,
                              sad: 0,
                              angry: 0,
                              natural: 0,
                              relaxed: 0,
                            ),
                            ...mapToFirestore(
                              {
                                'startAt': DateTime.now(),
                              },
                            ),
                          }, sessionRecordReference);

                          context.pushNamed(
                            'SessionPicCustom',
                            queryParameters: {
                              'age': serializeParam(
                                _model.disabledprofileExist?.age,
                                ParamType.int,
                              ),
                              'ethnicity': serializeParam(
                                _model.disabledprofileExist?.ethnicity,
                                ParamType.String,
                              ),
                              'isMale': serializeParam(
                                _model.disabledprofileExist?.isMale,
                                ParamType.bool,
                              ),
                              'skinColor': serializeParam(
                                _model.disabledprofileExist?.skinColor,
                                ParamType.String,
                              ),
                              'hairColor': serializeParam(
                                _model.disabledprofileExist?.hairColor,
                                ParamType.String,
                              ),
                              'eyeColor': serializeParam(
                                _model.disabledprofileExist?.eyeColor,
                                ParamType.String,
                              ),
                              'isSessionCreated': serializeParam(
                                true,
                                ParamType.bool,
                              ),
                              'sessionRef': serializeParam(
                                _model.sessionCreated?.reference,
                                ParamType.DocumentReference,
                              ),
                              'facialhair': serializeParam(
                                _model.disabledprofileExist?.facialHair,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          context.pushNamed(
                            'SessionPicCustom',
                            queryParameters: {
                              'age': serializeParam(
                                30,
                                ParamType.int,
                              ),
                              'ethnicity': serializeParam(
                                'european',
                                ParamType.String,
                              ),
                              'isMale': serializeParam(
                                true,
                                ParamType.bool,
                              ),
                              'skinColor': serializeParam(
                                'medium',
                                ParamType.String,
                              ),
                              'hairColor': serializeParam(
                                'black',
                                ParamType.String,
                              ),
                              'eyeColor': serializeParam(
                                'black',
                                ParamType.String,
                              ),
                              'isSessionCreated': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                              'sessionRef': serializeParam(
                                null,
                                ParamType.DocumentReference,
                              ),
                              'facialhair': serializeParam(
                                'clean-shaven',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }

                        setState(() {});
                      },
                      text: 'Start a Session ',
                      options: FFButtonOptions(
                        width: 400.0,
                        height: 100.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0x8B4036A4),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 30.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        context.goNamed('SessionNoBCI');
                      },
                      text: 'No BCI Session ',
                      options: FFButtonOptions(
                        width: 400.0,
                        height: 100.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0x8B4036A4),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 30.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
