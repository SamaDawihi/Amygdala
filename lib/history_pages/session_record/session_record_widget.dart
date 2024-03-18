import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'session_record_model.dart';
export 'session_record_model.dart';

class SessionRecordWidget extends StatefulWidget {
  const SessionRecordWidget({
    super.key,
    required this.session,
  });

  final SessionRecord? session;

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
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 570.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: StreamBuilder<SessionRecord>(
        stream: SessionRecord.getDocument(widget.session!.reference),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF4036A4),
                  ),
                ),
              ),
            );
          }
          final columnSessionRecord = snapshot.data!;
          return Column(
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
                      child: Image.network(
                        valueOrDefault<String>(
                          functions.getMaxEmotionImage(functions.getMaxEmotion(
                              columnSessionRecord.happy,
                              columnSessionRecord.sad,
                              columnSessionRecord.angry,
                              columnSessionRecord.relaxed,
                              columnSessionRecord.neutral)),
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/nbozqsm1b5v1/Screenshot_2023-11-30_144219.png',
                        ),
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Mostly ${functions.getMaxEmotion(widget.session!.happy, columnSessionRecord.sad, columnSessionRecord.angry, columnSessionRecord.relaxed, columnSessionRecord.neutral)}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Text(
                    dateTimeFormat('relative', columnSessionRecord.startAt!),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Date | ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: dateTimeFormat(
                                      'd-M-y', columnSessionRecord.startAt!),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Start : ',
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                TextSpan(
                                  text: dateTimeFormat(
                                      'jm', columnSessionRecord.startAt!),
                                  style: const TextStyle(),
                                ),
                                const TextSpan(
                                  text: ' | End : ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: dateTimeFormat(
                                      'jm', columnSessionRecord.endAt!),
                                  style: const TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
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
          );
        },
      ),
    );
  }
}
