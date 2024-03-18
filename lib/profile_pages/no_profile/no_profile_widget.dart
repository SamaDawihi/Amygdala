import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'no_profile_model.dart';
export 'no_profile_model.dart';

class NoProfileWidget extends StatefulWidget {
  const NoProfileWidget({super.key});

  @override
  State<NoProfileWidget> createState() => _NoProfileWidgetState();
}

class _NoProfileWidgetState extends State<NoProfileWidget> {
  late NoProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoProfileModel());

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
      height: 500.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
            child: Lottie.network(
              'https://lottie.host/36333228-a047-4b49-8bf4-1e79a82d6a3e/lYvHMUvYFU.json',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
              animate: true,
            ),
          ),
          Text(
            'There is No Profile related to your Account',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 28.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ].divide(const SizedBox(height: 20.0)),
      ),
    );
  }
}
