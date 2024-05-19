import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProcessedOrdersRecord extends FirestoreRecord {
  ProcessedOrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "orderID" field.
  DocumentReference? _orderID;
  DocumentReference? get orderID => _orderID;
  bool hasOrderID() => _orderID != null;

  // "riderID" field.
  DocumentReference? _riderID;
  DocumentReference? get riderID => _riderID;
  bool hasRiderID() => _riderID != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _orderID = snapshotData['orderID'] as DocumentReference?;
    _riderID = snapshotData['riderID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('processedOrders');

  static Stream<ProcessedOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProcessedOrdersRecord.fromSnapshot(s));

  static Future<ProcessedOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProcessedOrdersRecord.fromSnapshot(s));

  static ProcessedOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProcessedOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProcessedOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProcessedOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProcessedOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProcessedOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProcessedOrdersRecordData({
  DocumentReference? userID,
  DocumentReference? orderID,
  DocumentReference? riderID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'orderID': orderID,
      'riderID': riderID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProcessedOrdersRecordDocumentEquality
    implements Equality<ProcessedOrdersRecord> {
  const ProcessedOrdersRecordDocumentEquality();

  @override
  bool equals(ProcessedOrdersRecord? e1, ProcessedOrdersRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.orderID == e2?.orderID &&
        e1?.riderID == e2?.riderID;
  }

  @override
  int hash(ProcessedOrdersRecord? e) =>
      const ListEquality().hash([e?.userID, e?.orderID, e?.riderID]);

  @override
  bool isValidKey(Object? o) => o is ProcessedOrdersRecord;
}
