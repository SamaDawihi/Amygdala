import '/backend/backend.dart';
import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/history_pages/empty_sessions_component/empty_sessions_component_widget.dart';
import '/history_pages/session_record/session_record_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'history_model.dart';
export 'history_model.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({
    super.key,
    this.disabledProfile,
  });

  final DocumentReference? disabledProfile;

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  late HistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Team Activity',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [
            Container(
              decoration: const BoxDecoration(),
              child: Container(
                width: 300.0,
                decoration: const BoxDecoration(),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.sideNavModel,
                updateCallback: () => setState(() {}),
                child: const SideNavWidget(
                  currentPage: 4,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(40.0, 30.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 0.0, 4.0),
                          child: Text(
                            'Session History',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Below is a summary of sessions.',
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: FlutterFlowChoiceChips(
                                  options: const [
                                    ChipData('All'),
                                    ChipData('Happy'),
                                    ChipData('Relaxed'),
                                    ChipData('Sad'),
                                    ChipData('Angry'),
                                    ChipData('Neutral')
                                  ],
                                  onChanged: (val) => setState(() => _model
                                      .choiceChipsValue = val?.firstOrNull),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                    iconColor:
                                        FlutterFlowTheme.of(context).info,
                                    iconSize: 18.0,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    borderWidth: 1.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 18.0,
                                    elevation: 0.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 1.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  chipSpacing: 8.0,
                                  rowSpacing: 12.0,
                                  multiselect: false,
                                  initialized: _model.choiceChipsValue != null,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                    ['All'],
                                  ),
                                  wrapped: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: StreamBuilder<List<SessionRecord>>(
                            stream: querySessionRecord(
                              queryBuilder: (sessionRecord) => sessionRecord
                                  .where(
                                    'disabledProfile',
                                    isEqualTo: widget.disabledProfile,
                                  )
                                  .orderBy('endAt', descending: true),
                            ),
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
                              List<SessionRecord> listViewSessionRecordList =
                                  snapshot.data!;
                              if (listViewSessionRecordList.isEmpty) {
                                return const EmptySessionsComponentWidget();
                              }
                              return ListView.separated(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  16.0,
                                  0,
                                  16.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewSessionRecordList.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 0.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewSessionRecord =
                                      listViewSessionRecordList[listViewIndex];
                                  return Visibility(
                                    visible: (_model.choiceChipsValue ==
                                            'All') ||
                                        (_model.choiceChipsValue ==
                                            functions.getMaxEmotion(
                                                listViewSessionRecord.happy,
                                                listViewSessionRecord.sad,
                                                listViewSessionRecord.angry,
                                                listViewSessionRecord.relaxed,
                                                listViewSessionRecord.neutral)),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'HistoryRecord',
                                          queryParameters: {
                                            'sessionId': serializeParam(
                                              listViewSessionRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: wrapWithModel(
                                        model:
                                            _model.sessionRecordModels.getModel(
                                          listViewIndex.toString(),
                                          listViewIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        child: SessionRecordWidget(
                                          key: Key(
                                            'Keyyth_${listViewIndex.toString()}',
                                          ),
                                          session: listViewSessionRecord,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
