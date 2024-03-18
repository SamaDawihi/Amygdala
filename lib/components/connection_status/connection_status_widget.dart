import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'connection_status_model.dart';
export 'connection_status_model.dart';

class ConnectionStatusWidget extends StatefulWidget {
  const ConnectionStatusWidget({super.key});

  @override
  State<ConnectionStatusWidget> createState() => _ConnectionStatusWidgetState();
}

class _ConnectionStatusWidgetState extends State<ConnectionStatusWidget> {
  late ConnectionStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectionStatusModel());

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.circle_sharp,
            color: FFAppState().connectionStatus.condition >= 4
                ? FlutterFlowTheme.of(context).success
                : FlutterFlowTheme.of(context).error,
            size: 24.0,
          ),
          AutoSizeText(
            FFAppState().connectionStatus.status,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontWeight: FontWeight.w800,
                ),
            minFontSize: 8.0,
          ),
          AlignedTooltip(
            content: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  FFAppState().connectionStatus.details,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyLarge,
                )),
            offset: 4.0,
            preferredDirection: AxisDirection.down,
            borderRadius: BorderRadius.circular(8.0),
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 4.0,
            tailBaseWidth: 24.0,
            tailLength: 12.0,
            waitDuration: const Duration(milliseconds: 100),
            showDuration: const Duration(milliseconds: 1500),
            triggerMode: TooltipTriggerMode.tap,
            child: Icon(
              Icons.info_outline_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 14.0,
            ),
          ),
        ].divide(const SizedBox(width: 4.0)),
      ),
    );
  }
}
