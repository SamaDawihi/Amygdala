import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'session_no_b_c_i_model.dart';
export 'session_no_b_c_i_model.dart';

class SessionNoBCIWidget extends StatefulWidget {
  const SessionNoBCIWidget({
    super.key,
    this.disabledProfile,
    this.createdSession,
  });

  final DisabledProfileRecord? disabledProfile;
  final DocumentReference? createdSession;

  @override
  State<SessionNoBCIWidget> createState() => _SessionNoBCIWidgetState();
}

class _SessionNoBCIWidgetState extends State<SessionNoBCIWidget> {
  late SessionNoBCIModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessionNoBCIModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (!_model.terminated) {
        _model.timerController.onResetTimer();

        setState(() {
          _model.predictedEmotion =
              FFAppState().emotions[random_data.randomInteger(0, 4)];
          _model.doneCoditionChecking = true;
        });
        if (widget.createdSession != null) {
          await widget.createdSession!.update({
            ...createSessionRecordData(
              angry: _model.predictedEmotion == 'Angry' ? 1 : 0,
              endAt: getCurrentTimestamp,
            ),
            ...mapToFirestore(
              {
                'happy': FieldValue.increment(
                    _model.predictedEmotion == 'Happy' ? 1 : 0),
                'sad': FieldValue.increment(
                    _model.predictedEmotion == 'Sad' ? 1 : 0),
                'natural': FieldValue.increment(
                    _model.predictedEmotion == 'Natural' ? 1 : 0),
                'relaxed': FieldValue.increment(
                    _model.predictedEmotion == 'Relaxed' ? 1 : 0),
              },
            ),
          });
        }
        // If First Time Update the display emotion even before the image comes
        if (_model.displayEmotion == null || _model.displayEmotion == '') {
          setState(() {
            _model.displayEmotion = _model.predictedEmotion;
          });
        }
        _model.getImageIdApi = await ReplicateImageCall.call(
          prompt: functions.createImageDescription(
              _model.predictedEmotion!, widget.disabledProfile),
        );
        if ((_model.getImageIdApi?.succeeded ?? true)) {
          setState(() {
            _model.imageApiStatus =
                'Get ID: ${(_model.getImageIdApi?.jsonBody ?? '').toString()}';
          });
          _model.timerController.onStartTimer();
          await Future.delayed(const Duration(milliseconds: 30000));
          _model.getImageApiCall = await GetImageCall.call(
            id: ReplicateImageCall.id(
              (_model.getImageIdApi?.jsonBody ?? ''),
            ),
          );
          if ((_model.getImageApiCall?.succeeded ?? true)) {
            setState(() {
              _model.addToImagePath(GetImageCall.imagePath(
                (_model.getImageApiCall?.jsonBody ?? ''),
              )!
                  .first);
              _model.imageApiStatus =
                  'Get Image: ${(_model.getImageApiCall?.jsonBody ?? '').toString()}';
            });
          } else {
            setState(() {
              _model.imageApiStatus = 'Failed To Get Image';
            });
          }
        } else {
          // If Failed To Generate Image Continue with no Image
          setState(() {
            _model.imageApiStatus = 'Failed To Get Image ID';
          });
          _model.timerController.timer.setPresetTime(mSec: 10000, add: false);
          _model.timerController.onResetTimer();

          _model.timerController.onStartTimer();
          await Future.delayed(const Duration(milliseconds: 10000));
        }

        setState(() {
          _model.displayEmotion = _model.predictedEmotion;
        });
      }
    });

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/image-removebg-preview.png',
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlutterFlowTimer(
                      initialTime: _model.timerMilliseconds,
                      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        hours: false,
                        milliSecond: false,
                      ),
                      controller: _model.timerController,
                      updateStateInterval: const Duration(milliseconds: 1000),
                      onChanged: (value, displayTime, shouldUpdate) {
                        _model.timerMilliseconds = value;
                        _model.timerValue = displayTime;
                        if (shouldUpdate) setState(() {});
                      },
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    _model.terminated = false;
                                  });

                                  await widget.createdSession!
                                      .update(createSessionRecordData(
                                    endAt: getCurrentTimestamp,
                                  ));

                                  context.goNamed('Home');
                                },
                                text: 'Terminate',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).error,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  hoverColor: const Color(0xFFDE1818),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 5.0)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      if (!_model.doneCoditionChecking) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 50.0),
                                  child: Lottie.network(
                                    'https://lottie.host/41f11af0-b4b1-4446-af42-78c509770079/PCX2v5gJny.json',
                                    width: 300.0,
                                    height: 130.0,
                                    fit: BoxFit.cover,
                                    animate: true,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Processing ...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 300.0),
                              child: Text(
                                'Thank you for your patience',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 15.0)),
                        );
                      } else {
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (_model.imagePath.isNotEmpty) {
                                    return Stack(
                                      children: [
                                        if (_model.imagePath.length > 1)
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                _model.imagePath[
                                                    _model.imagePath.length -
                                                        2],
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/eep0xg5cq6pa/Screenshot_2023-11-28_150737.png',
                                              ),
                                              width: 500.0,
                                              height: 500.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        if (_model.imagePath.isNotEmpty)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 30.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  _model.imagePath.last,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/1yxux439o1gv/Screenshot_2023-11-28_150600.png',
                                                ),
                                                width: 500.0,
                                                height: 500.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 50.0),
                                              child: Lottie.network(
                                                'https://lottie.host/41f11af0-b4b1-4446-af42-78c509770079/PCX2v5gJny.json',
                                                width: 300.0,
                                                height: 130.0,
                                                fit: BoxFit.cover,
                                                animate: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Getting The Image',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.w800,
                                              ),
                                        ),
                                        Text(
                                          'Thank you for your patience',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(height: 15.0)),
                                    );
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: Text(
                                  '${widget.disabledProfile != null ? widget.disabledProfile?.name : 'Tahani'} is ${_model.displayEmotion}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  'Status:${_model.imageApiStatus}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                      ),
                                )),
                              ),
                            ].divide(const SizedBox(height: 15.0)),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
