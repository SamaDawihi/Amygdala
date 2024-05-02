import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'c_o_r_sproxy_model.dart';
export 'c_o_r_sproxy_model.dart';

class CORSproxyWidget extends StatefulWidget {
  const CORSproxyWidget({super.key});

  @override
  State<CORSproxyWidget> createState() => _CORSproxyWidgetState();
}

class _CORSproxyWidgetState extends State<CORSproxyWidget> {
  late CORSproxyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CORSproxyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      _model.image,
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/eep0xg5cq6pa/Screenshot_2023-11-28_150737.png',
                    ),
                    width: 500.0,
                    height: 500.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        _model.postAPiResult =
                            await RequestImageIdCorsCall.call(
                          token: FFAppState().imageGenerationToken,
                          prompt: 'Girl',
                        );
                        if ((_model.postAPiResult?.succeeded ?? true)) {
                          setState(() {
                            _model.postResult =
                                (_model.postAPiResult?.jsonBody ?? '')
                                    .toString();
                            _model.imageId = RequestImageIdCorsCall.id(
                              (_model.postAPiResult?.jsonBody ?? ''),
                            )!;
                          });
                        } else {
                          setState(() {
                            _model.postResult =
                                'no success (Failed) - ${(_model.postAPiResult?.jsonBody ?? '').toString()}';
                          });
                        }

                        setState(() {});
                      },
                      text: 'Post Request',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Request Result: ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    SelectionArea(
                        child: AutoSizeText(
                      _model.postResult.maybeHandleOverflow(maxChars: 50),
                      maxLines: 3,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                      minFontSize: 6.0,
                    )),
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Image ID: ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          TextSpan(
                            text: _model.imageId,
                            style: const TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        _model.getAPiResult = await GetImagePathCORSCall.call(
                          token: FFAppState().imageGenerationToken,
                          id: _model.imageId,
                        );
                        if ((_model.postAPiResult?.succeeded ?? true)) {
                          setState(() {
                            _model.getResult =
                                (_model.getAPiResult?.jsonBody ?? '')
                                    .toString();
                            _model.image = GetImagePathCORSCall.imagePath(
                              (_model.getAPiResult?.jsonBody ?? ''),
                            )!
                                .first;
                          });
                        } else {
                          setState(() {
                            _model.getResult =
                                'Failed - ${(_model.getAPiResult?.jsonBody ?? '').toString()}';
                          });
                        }

                        setState(() {});
                      },
                      text: 'Get Request',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Request Result: ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    SelectionArea(
                        child: AutoSizeText(
                      _model.getResult.maybeHandleOverflow(maxChars: 50),
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                      minFontSize: 6.0,
                    )),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('Home');
                      },
                      text: 'Home',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ]
                      .divide(const SizedBox(height: 20.0))
                      .addToStart(const SizedBox(height: 20.0)),
                ),
              ].divide(const SizedBox(width: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
