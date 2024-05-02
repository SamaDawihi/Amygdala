import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'normal_proxy_model.dart';
export 'normal_proxy_model.dart';

class NormalProxyWidget extends StatefulWidget {
  const NormalProxyWidget({super.key});

  @override
  State<NormalProxyWidget> createState() => _NormalProxyWidgetState();
}

class _NormalProxyWidgetState extends State<NormalProxyWidget> {
  late NormalProxyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NormalProxyModel());

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
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
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
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      _model.getImageAction = await actions.postImage(
                        'test',
                      );
                      setState(() {
                        _model.result =
                            '${_model.getImageAction?.result} - ${_model.getImageAction?.getResult}';
                      });

                      setState(() {});
                    },
                    text: 'Post Request',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                          text: 'Result: ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                        TextSpan(
                          text: _model.result,
                          style: const TextStyle(),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                    maxLines: 10,
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('Home');
                    },
                    text: 'Home',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
