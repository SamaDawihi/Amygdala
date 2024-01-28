import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'session_pic_custom_model.dart';
export 'session_pic_custom_model.dart';

class SessionPicCustomWidget extends StatefulWidget {
  const SessionPicCustomWidget({
    super.key,
    required this.age,
    required this.ethnicity,
    required this.isMale,
    required this.skinColor,
    required this.hairColor,
    required this.eyeColor,
    required this.isSessionCreated,
    required this.sessionRef,
    String? facialhair,
  }) : facialhair = facialhair ?? 'none';

  final int? age;
  final String? ethnicity;
  final bool? isMale;
  final String? skinColor;
  final String? hairColor;
  final String? eyeColor;
  final bool? isSessionCreated;
  final DocumentReference? sessionRef;
  final String facialhair;

  @override
  State<SessionPicCustomWidget> createState() => _SessionPicCustomWidgetState();
}

class _SessionPicCustomWidgetState extends State<SessionPicCustomWidget> {
  late SessionPicCustomModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessionPicCustomModel());

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
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                width: 100.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).alternate,
                      FlutterFlowTheme.of(context).primaryBackground
                    ],
                    stops: const [0.0, 1.0],
                    begin: const AlignmentDirectional(0.87, -1.0),
                    end: const AlignmentDirectional(-0.87, 1.0),
                  ),
                ),
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                50.0, 0.0, 0.0, 0.0),
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                100.0, 0.0, 0.0, 0.0),
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
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 50.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Icon(
                                      Icons.circle_sharp,
                                      color: Color(0xFF1FA595),
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'BCI Connected',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 30.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (widget.sessionRef != null) {
                                        await widget.sessionRef!.update({
                                          ...mapToFirestore(
                                            {
                                              'endAt':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });

                                        context.pushNamed('Home');
                                      } else {
                                        context.pushNamed('Home');
                                      }
                                    },
                                    text: 'Terminate Session',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFF4036A4),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'ID: ${_model.id}',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  'image Reuest Body: ${_model.imageReuestStatus}',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      _model.imagePath,
                                      width: 500.0,
                                      height: 500.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowRadioButton(
                                  options: [
                                    'Happy',
                                    'Angry',
                                    'Natural',
                                    'Relaxed',
                                    'Depressed'
                                  ].toList(),
                                  onChanged: (val) => setState(() {}),
                                  controller: _model
                                          .radioButtonValueController ??=
                                      FormFieldController<String>('Natural'),
                                  optionHeight: 32.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  selectedTextStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveRadioButtonColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          _model.radioButtonValue!,
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    _model.apiResultID =
                                        await ReplicateImageCall.call(
                                      prompt:
                                          'a${widget.age?.toString()}years old${widget.ethnicity}${valueOrDefault<String>(
                                        widget.isMale! ? 'male' : 'female',
                                        'male',
                                      )}, with ${widget.skinColor}skin color, ${widget.hairColor} hair and ${widget.eyeColor} eyes ${widget.isMale! ? ' he has' : ''}${widget.isMale! ? widget.facialhair : ''}, who seems to be feeling ${_model.radioButtonValue}',
                                    );
                                    if ((_model.apiResultID?.succeeded ??
                                        true)) {
                                      setState(() {
                                        _model.id = ReplicateImageCall.id(
                                          (_model.apiResultID?.jsonBody ?? ''),
                                        )!;
                                      });
                                      if (widget.sessionRef != null) {
                                        if (_model.radioButtonValue ==
                                            'Happy') {
                                          await widget.sessionRef!.update({
                                            ...mapToFirestore(
                                              {
                                                'happy':
                                                    FieldValue.increment(1),
                                              },
                                            ),
                                          });
                                        } else {
                                          if (_model.radioButtonValue ==
                                              'Angry') {
                                            await widget.sessionRef!.update({
                                              ...mapToFirestore(
                                                {
                                                  'angry':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });
                                          } else {
                                            if (_model.radioButtonValue ==
                                                'Natural') {
                                              await widget.sessionRef!.update({
                                                ...mapToFirestore(
                                                  {
                                                    'natural':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                            }
                                          }
                                        }
                                      }
                                    } else {
                                      setState(() {
                                        _model.id = 'No Success ';
                                      });
                                    }

                                    setState(() {});
                                  },
                                  text: 'Generate',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
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
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    _model.apiResultImage =
                                        await GetImageCall.call(
                                      id: ReplicateImageCall.id(
                                        (_model.apiResultID?.jsonBody ?? ''),
                                      ),
                                    );
                                    setState(() {
                                      _model.imageReuestStatus =
                                          'image Reuest started';
                                    });
                                    setState(() {
                                      _model.imageReuestStatus =
                                          (_model.apiResultImage?.statusCode ??
                                                  200)
                                              .toString();
                                    });
                                    if ((_model.apiResultImage?.succeeded ??
                                        true)) {
                                      setState(() {
                                        _model.imagePath =
                                            GetImageCall.imagePath(
                                          (_model.apiResultImage?.jsonBody ??
                                              ''),
                                        )!
                                                .first;
                                        _model.imageReuestStatus = (_model
                                                    .apiResultImage
                                                    ?.statusCode ??
                                                200)
                                            .toString();
                                        _model.id = ReplicateImageCall.id(
                                          (_model.apiResultID?.jsonBody ?? ''),
                                        )!;
                                      });
                                    } else {
                                      setState(() {
                                        _model.imageReuestStatus =
                                            'image Reuest Failed';
                                        _model.id = ReplicateImageCall.id(
                                          (_model.apiResultID?.jsonBody ?? ''),
                                        )!;
                                      });
                                    }

                                    setState(() {});
                                  },
                                  text: 'Get image',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
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
                                  ),
                                ),
                              ],
                            ),
                          ].divide(const SizedBox(width: 5.0)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 80.0, 0.0, 10.0),
                          child: Text(
                            'Ali is feeling',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: Text(
                            'angry,upset,fear,tense',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
