import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'signup_user_widget.dart' show SignupUserWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupUserModel extends FlutterFlowModel<SignupUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for pass widget.
  FocusNode? passFocusNode;
  TextEditingController? passTextController;
  late bool passVisibility;
  String? Function(BuildContext, String?)? passTextControllerValidator;
  // State field(s) for conPass widget.
  FocusNode? conPassFocusNode;
  TextEditingController? conPassTextController;
  late bool conPassVisibility;
  String? Function(BuildContext, String?)? conPassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passVisibility = false;
    conPassVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    displayNameFocusNode?.dispose();
    displayNameTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passFocusNode?.dispose();
    passTextController?.dispose();

    conPassFocusNode?.dispose();
    conPassTextController?.dispose();
  }
}
