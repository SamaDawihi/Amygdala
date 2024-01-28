import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'session_record_model.dart';
export 'session_record_model.dart';

class SessionRecordWidget extends StatefulWidget {
  const SessionRecordWidget({
    super.key,
    required this.session,
  });

  final DocumentReference? session;

  @override
  State<SessionRecordWidget> createState() => _SessionRecordWidgetState();
}

class _SessionRecordWidgetState extends State<SessionRecordWidget> {
  late SessionRecordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessionRecordModel());

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

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 570.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFAAE76D),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                    'assets/images/Screenshot_2023-11-30_143639.png',
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Mosty Happy',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Text(
                '4m ago',
                style: FlutterFlowTheme.of(context).labelSmall,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: FlutterFlowTheme.of(context).primary,
                    offset: const Offset(-2.0, 0.0),
                  )
                ],
                border: Border.all(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                      child: RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Date | ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '29-11-2024',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Text(
                        'Start : 5:00 | End : 5:11',
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ),
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      indent: 0.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ].addToEnd(const SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
