import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'emo_filter_model.dart';
export 'emo_filter_model.dart';

class EmoFilterWidget extends StatefulWidget {
  const EmoFilterWidget({super.key});

  @override
  State<EmoFilterWidget> createState() => _EmoFilterWidgetState();
}

class _EmoFilterWidgetState extends State<EmoFilterWidget> {
  late EmoFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmoFilterModel());

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
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
            child: FlutterFlowChoiceChips(
              options: const [
                ChipData('All'),
                ChipData('Happy'),
                ChipData('Calm'),
                ChipData('Nuetural'),
                ChipData('Fatigue'),
                ChipData('Tense')
              ],
              onChanged: (val) =>
                  setState(() => _model.choiceChipsValue = val?.first),
              selectedChipStyle: ChipStyle(
                backgroundColor: const Color(0xFF4036A4),
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).info,
                    ),
                iconColor: FlutterFlowTheme.of(context).info,
                iconSize: 18.0,
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).accent1,
                borderWidth: 1.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
              unselectedChipStyle: ChipStyle(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                iconColor: FlutterFlowTheme.of(context).secondaryText,
                iconSize: 18.0,
                elevation: 0.0,
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 1.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
              chipSpacing: 8.0,
              rowSpacing: 12.0,
              multiselect: false,
              initialized: _model.choiceChipsValue != null,
              alignment: WrapAlignment.start,
              controller: _model.choiceChipsValueController ??=
                  FormFieldController<List<String>>(
                ['All'],
              ),
              wrapped: true,
            ),
          ),
        ],
      ),
    );
  }
}
