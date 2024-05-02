import '/backend/backend.dart';
import '/components/confirmation_component/confirmation_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'disabled_profile_list_view_model.dart';
export 'disabled_profile_list_view_model.dart';

class DisabledProfileListViewWidget extends StatefulWidget {
  const DisabledProfileListViewWidget({
    super.key,
    required this.disabledProfile,
  });

  final DisabledProfileRecord? disabledProfile;

  @override
  State<DisabledProfileListViewWidget> createState() =>
      _DisabledProfileListViewWidgetState();
}

class _DisabledProfileListViewWidgetState
    extends State<DisabledProfileListViewWidget> with TickerProviderStateMixin {
  late DisabledProfileListViewModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisabledProfileListViewModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'profile',
            queryParameters: {
              'disabledProfile': serializeParam(
                widget.disabledProfile?.reference,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 7.0,
                color: Color(0x32171717),
                offset: Offset(
                  0.0,
                  3.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.disabledProfile!.hasPhoto()
                          ? valueOrDefault<String>(
                              widget.disabledProfile?.photo,
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/nwtsmnmcy3g7/female_avatar.jpeg',
                            )
                          : valueOrDefault<String>(
                              widget.disabledProfile!.isMale
                                  ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/760wzgp9yyl4/male_avatar.jpeg'
                                  : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/nwtsmnmcy3g7/female_avatar.jpeg',
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/nwtsmnmcy3g7/female_avatar.jpeg',
                            ),
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/nwtsmnmcy3g7/female_avatar.jpeg',
                    ),
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.disabledProfile?.name,
                          'Name',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          dateTimeFormat(
                              'd/M/y', widget.disabledProfile!.birthday!),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'History',
                      queryParameters: {
                        'disabledProfile': serializeParam(
                          widget.disabledProfile?.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'History',
                  icon: const Icon(
                    Icons.history_sharp,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                FFButtonWidget(
                  onPressed: () async {
                    var sessionRecordReference = SessionRecord.collection.doc();
                    await sessionRecordReference.set(createSessionRecordData(
                      disabledProfile: widget.disabledProfile?.reference,
                      startAt: getCurrentTimestamp,
                      happy: 0,
                      sad: 0,
                      relaxed: 0,
                      angry: 0,
                      neutral: 0,
                      status: 'Started',
                    ));
                    _model.sessionId = SessionRecord.getDocumentFromData(
                        createSessionRecordData(
                          disabledProfile: widget.disabledProfile?.reference,
                          startAt: getCurrentTimestamp,
                          happy: 0,
                          sad: 0,
                          relaxed: 0,
                          angry: 0,
                          neutral: 0,
                          status: 'Started',
                        ),
                        sessionRecordReference);

                    context.goNamed(
                      'Session',
                      queryParameters: {
                        'disabledProfile': serializeParam(
                          widget.disabledProfile,
                          ParamType.Document,
                        ),
                        'createdSession': serializeParam(
                          _model.sessionId?.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'disabledProfile': widget.disabledProfile,
                      },
                    );

                    setState(() {});
                  },
                  text: 'Start Session',
                  icon: const FaIcon(
                    FontAwesomeIcons.headSideVirus,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'EditProfile',
                          queryParameters: {
                            'disabledProfile': serializeParam(
                              widget.disabledProfile,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'disabledProfile': widget.disabledProfile,
                          },
                        );
                      },
                      child: Icon(
                        Icons.edit_outlined,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                    ),
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: ConfirmationComponentWidget(
                                  title: 'Delete Profile',
                                  message:
                                      'Are you sure you want to delete this profile?',
                                  confirmText: 'Delete',
                                  cancelText: 'Cancel',
                                  confirmAction: () async {
                                    _model.sessionsToBeDeleted =
                                        await querySessionRecordOnce(
                                      queryBuilder: (sessionRecord) =>
                                          sessionRecord.where(
                                        'disabledProfile',
                                        isEqualTo:
                                            widget.disabledProfile?.reference,
                                      ),
                                    );
                                    setState(() {
                                      _model.deleteSessionsLoop = 0;
                                    });
                                    while (_model.deleteSessionsLoop <
                                        valueOrDefault<int>(
                                          _model.sessionsToBeDeleted?.length,
                                          0,
                                        )) {
                                      await _model
                                          .sessionsToBeDeleted![
                                              _model.deleteSessionsLoop]
                                          .reference
                                          .delete();
                                      setState(() {
                                        _model.deleteSessionsLoop =
                                            _model.deleteSessionsLoop + 1;
                                      });
                                    }
                                    await widget.disabledProfile!.reference
                                        .delete();
                                    Navigator.pop(context);
                                  },
                                  cancelAction: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));

                          setState(() {});
                        },
                        child: Icon(
                          Icons.delete_forever_outlined,
                          color: FlutterFlowTheme.of(context).error,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ].divide(const SizedBox(width: 16.0)),
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
