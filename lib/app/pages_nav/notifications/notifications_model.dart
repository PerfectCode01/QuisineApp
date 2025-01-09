import '/components/produit_loader_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for produitLoader component.
  late ProduitLoaderModel produitLoaderModel;

  @override
  void initState(BuildContext context) {
    produitLoaderModel = createModel(context, () => ProduitLoaderModel());
  }

  @override
  void dispose() {
    produitLoaderModel.dispose();
  }
}
