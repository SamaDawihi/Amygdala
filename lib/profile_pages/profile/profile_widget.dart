import '/backend/backend.dart';
import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    required this.disabledProfile,
  });

  final DocumentReference? disabledProfile;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Home',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [
            Container(
              decoration: const BoxDecoration(),
              child: SizedBox(
                width: 200.0,
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
                  currentPage: 1,
                ),
              ),
              Expanded(
                child: StreamBuilder<DisabledProfileRecord>(
                  stream: DisabledProfileRecord.getDocument(
                      widget.disabledProfile!),
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
                    final columnDisabledProfileRecord = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 50.0, 0.0, 0.0),
                                    child: GradientText(
                                      'Profile',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 30.0,
                                          ),
                                      colors: const [
                                        Color(0xFF1D1753),
                                        Color(0xFF4036A4)
                                      ],
                                      gradientType: GradientType.radial,
                                      radius: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 30.0, 0.0),
                                child: Lottie.network(
                                  'https://lottie.host/04297aaf-9807-4e1c-83cf-03a8edd1b470/IESuWdztNF.json',
                                  width: 150.0,
                                  height: 130.0,
                                  fit: BoxFit.fitHeight,
                                  animate: true,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GradientText(
                                        'Name : Ahmad Ali ',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        colors: const [
                                          Color(0xFF1D1753),
                                          Color(0xFF4036A4)
                                        ],
                                        gradientType: GradientType.radial,
                                        radius: 1.0,
                                      ),
                                      GradientText(
                                        'Age : 16 ',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        colors: const [
                                          Color(0xFF1D1753),
                                          Color(0xFF4036A4)
                                        ],
                                        gradientType: GradientType.radial,
                                        radius: 1.0,
                                      ),
                                      GradientText(
                                        'Ethnicity : Gulf Arab',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        colors: const [
                                          Color(0xFF1D1753),
                                          Color(0xFF4036A4)
                                        ],
                                        gradientType: GradientType.radial,
                                        radius: 1.0,
                                      ),
                                      GradientText(
                                        'Hair Color : black ',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        colors: const [
                                          Color(0xFF1D1753),
                                          Color(0xFF4036A4)
                                        ],
                                        gradientType: GradientType.radial,
                                        radius: 1.0,
                                      ),
                                      GradientText(
                                        'Skin Color : Medium',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        colors: const [
                                          Color(0xFF1D1753),
                                          Color(0xFF4036A4)
                                        ],
                                        gradientType: GradientType.radial,
                                        radius: 1.0,
                                      ),
                                      GradientText(
                                        'Eyes color : brown',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        colors: const [
                                          Color(0xFF1D1753),
                                          Color(0xFF4036A4)
                                        ],
                                        gradientType: GradientType.radial,
                                        radius: 1.0,
                                      ),
                                      GradientText(
                                        'facial hair : None',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        colors: const [
                                          Color(0xFF1D1753),
                                          Color(0xFF4036A4)
                                        ],
                                        gradientType: GradientType.radial,
                                        radius: 1.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 40.0, 0.0, 90.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 20.0, 12.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed('EditProfile');
                                        },
                                        text: 'Edit Profile',
                                        icon: const Icon(
                                          Icons.face,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 200.0,
                                          height: 48.0,
                                          padding: const EdgeInsets.all(0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFF4036A4),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 4.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 20.0, 12.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Remove Profile',
                                        icon: const Icon(
                                          Icons.remove_circle_outline_sharp,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 200.0,
                                          height: 48.0,
                                          padding: const EdgeInsets.all(0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 4.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
