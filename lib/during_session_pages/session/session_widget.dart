import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/confirmation_component/confirmation_component_widget.dart';
import '/components/information_component/information_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'session_model.dart';
export 'session_model.dart';

class SessionWidget extends StatefulWidget {
  const SessionWidget({
    super.key,
    this.disabledProfile,
    this.createdSession,
  });

  final DisabledProfileRecord? disabledProfile;
  final DocumentReference? createdSession;

  @override
  State<SessionWidget> createState() => _SessionWidgetState();
}

class _SessionWidgetState extends State<SessionWidget> {
  late SessionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkBCIConnection(context);
      // check if the connection is successful and if there is any BCI device connected
      if ((FFAppState().connectionStatus.condition >= 4) &&
          (FFAppState().connectionStatus.availableHeadsets.isNotEmpty)) {
        // check if deafult headset is in the available headsets
        if (FFAppState()
            .connectionStatus
            .availableHeadsets
            .contains(FFAppState().defaultHeadset)) {
          setState(() {
            _model.headsetId = FFAppState().defaultHeadset;
          });
        } else {
          // check if defaultheadset is set
          if (FFAppState().defaultHeadset != '') {
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: const AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: GestureDetector(
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: ConfirmationComponentWidget(
                      title: 'Default Headset Is Not Connected',
                      message:
                          'your Default Headset ${FFAppState().defaultHeadset}is not connected.',
                      confirmText:
                          'continue with ${FFAppState().connectionStatus.availableHeadsets.first}',
                      cancelText: 'Go to BCI Settings',
                      confirmAction: () async {
                        Navigator.pop(context);
                      },
                      cancelAction: () async {
                        context.goNamed('BciSetttings');
                      },
                    ),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          }
          setState(() {
            _model.headsetId =
                FFAppState().connectionStatus.availableHeadsets.first;
          });
        }
      } else {
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: ConfirmationComponentWidget(
                  title: 'BCI ERROR',
                  message: 'No Available Headsets',
                  confirmText: 'Check Connection Settings',
                  cancelText: 'Continue With Random Emotion',
                  confirmAction: () async {
                    if (widget.createdSession != null) {
                      unawaited(
                        () async {
                          await widget.createdSession!
                              .update(createSessionRecordData(
                            status: 'Canceled due no available headsets',
                            endAt: getCurrentTimestamp,
                          ));
                        }(),
                      );
                    }

                    context.goNamed('BciSetttings');
                  },
                  cancelAction: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));
      }

      if ((widget.createdSession?.id != null &&
              widget.createdSession?.id != '') &&
          (_model.headsetId != null && _model.headsetId != '')) {
        await widget.createdSession!.update(createSessionRecordData(
          headsetId: _model.headsetId,
        ));
      }
      setState(() {
        _model.doneCoditionChecking = true;
      });
      while (!_model.terminated) {
        _model.timerController.onResetTimer();

        if (_model.headsetId != null && _model.headsetId != '') {
          _model.metObject = await _model.getPredictedEmotion(context);
          if (_model.metObject!.engagementSet &&
              _model.metObject!.interestSet) {
            setState(() {
              _model.predictedEmotion =
                  functions.getEmotionByInterestEngagement(
                      _model.metObject!.interest, _model.metObject!.engagement);
              _model.met = (_model.metObject!.toMap()).toString();
            });
          } else {
            await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: const AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: GestureDetector(
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: InformationComponentWidget(
                      title: 'Low Accuracy',
                      message:
                          'Try Adjusting the headset set and check the accuracy through Emotiv Launcher App.',
                      confirmText: 'BCI Settings',
                      confirmAction: () async {
                        if (widget.createdSession != null) {
                          _model.lowAccuracySession =
                              await SessionRecord.getDocumentOnce(
                                  widget.createdSession!);

                          await widget.createdSession!
                              .update(createSessionRecordData(
                            endAt: getCurrentTimestamp,
                            status: 'Terminated due to low accuracy',
                          ));
                        }

                        context.goNamed('BciSetttings');
                      },
                    ),
                  ),
                );
              },
            ).then((value) => setState(() {}));

            return;
          }
        } else {
          setState(() {
            _model.predictedEmotion =
                FFAppState().emotions[random_data.randomInteger(0, 4)];
          });
        }

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
                'relaxed': FieldValue.increment(
                    _model.predictedEmotion == 'Relaxed' ? 1 : 0),
                'neutral': FieldValue.increment(
                    _model.predictedEmotion == 'Neutral' ? 1 : 0),
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
        _model.getImageIdApi = await RequestImageIdCorsCall.call(
          token: FFAppState().imageGenerationToken,
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
          _model.getImageApiCall = await GetImagePathCORSCall.call(
            token: FFAppState().imageGenerationToken,
            id: RequestImageIdCorsCall.id(
              (_model.getImageIdApi?.jsonBody ?? ''),
            ),
          );
          if ((_model.getImageApiCall?.succeeded ?? true)) {
            if (GetImagePathCORSCall.imagePath(
                      (_model.getImageApiCall?.jsonBody ?? ''),
                    ) !=
                    null &&
                (GetImagePathCORSCall.imagePath(
                  (_model.getImageApiCall?.jsonBody ?? ''),
                ))!
                    .isNotEmpty) {
              setState(() {
                _model.addToImagePath(GetImagePathCORSCall.imagePath(
                  (_model.getImageApiCall?.jsonBody ?? ''),
                )!
                    .first);
                _model.imageApiStatus =
                    'Get Image: ${(_model.getImageApiCall?.jsonBody ?? '').toString()}';
              });
            } else {
              setState(() {
                _model.imageApiStatus =
                    'Get Image: Empty Output - ${(_model.getImageApiCall?.jsonBody ?? '').toString()}';
              });
            }
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
          _model.timerController.timer.setPresetTime(mSec: 3000, add: false);
          _model.timerController.onResetTimer();

          _model.timerController.onStartTimer();
          await Future.delayed(const Duration(milliseconds: 3000));
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
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/image-removebg-preview.png',
                              width: 120.0,
                              height: 50.0,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: FlutterFlowTimer(
                          initialTime: _model.timerMilliseconds,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
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
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: const AlignmentDirectional(1.0, -1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'more Info',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Switch.adaptive(
                                    value: _model.switchValue ??=
                                        _model.showMoreInfo,
                                    onChanged: (newValue) async {
                                      setState(
                                          () => _model.switchValue = newValue);
                                      if (newValue) {
                                        setState(() {
                                          _model.showMoreInfo = true;
                                        });
                                      } else {
                                        setState(() {
                                          _model.showMoreInfo = false;
                                        });
                                      }
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: FFButtonWidget(
                                  key: const ValueKey('Button_b9nt'),
                                  onPressed: () async {
                                    _model.terminated = true;
                                    if (widget.createdSession != null) {
                                      _model.session =
                                          await SessionRecord.getDocumentOnce(
                                              widget.createdSession!);
                                      if (functions.getNumberOfEmotions(
                                              _model.session!) >
                                          0) {
                                        await widget.createdSession!
                                            .update(createSessionRecordData(
                                          endAt: getCurrentTimestamp,
                                          status: 'Completed',
                                        ));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Session terminated successfully',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      } else {
                                        await widget.createdSession!
                                            .update(createSessionRecordData(
                                          endAt: getCurrentTimestamp,
                                          status:
                                              'Terminated Before Capturing Any Emotion',
                                        ));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Session terminated Before Capturing Any Emotion',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .warning,
                                          ),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Session terminate. No records is saved for this session',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }

                                    context.goNamed('Home');

                                    setState(() {});
                                  },
                                  text: 'Terminate',
                                  options: FFButtonOptions(
                                    width: 120.0,
                                    height: 30.0,
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
                                          letterSpacing: 0.0,
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
                            ].divide(const SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
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
                                      letterSpacing: 0.0,
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
                                        letterSpacing: 0.0,
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
                                                width: 400.0,
                                                height: 400.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (_model.imagePath.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    _model.imagePath.last,
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/1yxux439o1gv/Screenshot_2023-11-28_150600.png',
                                                  ),
                                                  width: 400.0,
                                                  height: 400.0,
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
                                                  letterSpacing: 0.0,
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
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 15.0)),
                                      );
                                    }
                                  },
                                ),
                                if (_model.displayEmotion != null &&
                                    _model.displayEmotion != '')
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      '${widget.disabledProfile != null ? widget.disabledProfile?.name : 'Tahani'} is ${_model.displayEmotion}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                if (_model.showMoreInfo)
                                  SelectionArea(
                                      child: AutoSizeText(
                                    'Status:${_model.imageApiStatus}'
                                        .maybeHandleOverflow(maxChars: 200),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                    minFontSize: 8.0,
                                  )),
                                if (_model.showMoreInfo)
                                  SelectionArea(
                                      child: AutoSizeText(
                                    'Met Object:${_model.met}'
                                        .maybeHandleOverflow(maxChars: 200),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                    minFontSize: 8.0,
                                  )),
                              ].divide(const SizedBox(height: 15.0)),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
