import '/components/connection_status/connection_status_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile_pages/disabled_profile_list_view/disabled_profile_list_view_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Models for disabledProfileListView dynamic component.
  late FlutterFlowDynamicModels<DisabledProfileListViewModel>
      disabledProfileListViewModels;
  // Model for connectionStatus component.
  late ConnectionStatusModel connectionStatusModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    disabledProfileListViewModels =
        FlutterFlowDynamicModels(() => DisabledProfileListViewModel());
    connectionStatusModel = createModel(context, () => ConnectionStatusModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    disabledProfileListViewModels.dispose();
    connectionStatusModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
