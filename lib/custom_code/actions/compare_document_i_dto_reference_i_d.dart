// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference?> compareDocumentIDtoReferenceID(
  String documentID,
  List<DocumentReference> productTypeReferences,
) async {
  Map<String, DocumentReference> referenceMap = {
    for (var ref in productTypeReferences) ref.id: ref
  };

  return Future.value(referenceMap[documentID]);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
