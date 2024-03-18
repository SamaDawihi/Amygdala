import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile_pages/disabled_profile_list_view/disabled_profile_list_view_widget.dart';
import '/profile_pages/no_profile/no_profile_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              height: 200.0,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.sideNavModel,
                updateCallback: () => setState(() {}),
                child: const SideNavWidget(
                  currentPage: 0,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Text(
                              'Disabled Profiles',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 40.0,
                                  ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('AddProfile');
                            },
                            text: 'Add Profile',
                            icon: const Icon(
                              Icons.face,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: 200.0,
                              height: 48.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              hoverElevation: 7.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<List<DisabledProfileRecord>>(
                      stream: queryDisabledProfileRecord(
                        queryBuilder: (disabledProfileRecord) =>
                            disabledProfileRecord.where(
                          'caregiverID',
                          isEqualTo: currentUserReference,
                        ),
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
                        List<DisabledProfileRecord>
                            listViewDisabledProfileRecordList = snapshot.data!;
                        if (listViewDisabledProfileRecordList.isEmpty) {
                          return const Center(
                            child: NoProfileWidget(),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewDisabledProfileRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewDisabledProfileRecord =
                                listViewDisabledProfileRecordList[
                                    listViewIndex];
                            return wrapWithModel(
                              model:
                                  _model.disabledProfileListViewModels.getModel(
                                listViewIndex.toString(),
                                listViewIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              child: DisabledProfileListViewWidget(
                                key: Key(
                                  'Key1de_${listViewIndex.toString()}',
                                ),
                                disabledProfile: listViewDisabledProfileRecord,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('Session');
                          },
                          text: 'Start Anonymous Session',
                          icon: const FaIcon(
                            FontAwesomeIcons.headSideVirus,
                          ),
                          options: FFButtonOptions(
                            width: 400.0,
                            height: 100.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 30.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            hoverElevation: 10.0,
                          ),
                        ),
                        AlignedTooltip(
                          content: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'The generated image won\'t reflect the person\'s appearance. To achieve that, add a profile first.',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              )),
                          offset: 4.0,
                          preferredDirection: AxisDirection.up,
                          borderRadius: BorderRadius.circular(8.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          tailBaseWidth: 24.0,
                          tailLength: 12.0,
                          waitDuration: const Duration(milliseconds: 100),
                          showDuration: const Duration(milliseconds: 1500),
                          triggerMode: TooltipTriggerMode.tap,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 60.0),
                            child: Icon(
                              Icons.info_outline,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 26.0,
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 12.0)),
                    ),
                  ]
                      .divide(const SizedBox(height: 30.0))
                      .addToStart(const SizedBox(height: 30.0))
                      .addToEnd(const SizedBox(height: 40.0)),
                ),
              ),
            ].divide(const SizedBox(width: 30.0)),
          ),
        ),
      ),
    );
  }
}
