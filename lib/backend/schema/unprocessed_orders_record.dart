import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnprocessedOrdersRecord extends FirestoreRecord {
  UnprocessedOrdersRecord._(
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

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _orderID = snapshotData['orderID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('unprocessedOrders');

  static Stream<UnprocessedOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UnprocessedOrdersRecord.fromSnapshot(s));

  static Future<UnprocessedOrdersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UnprocessedOrdersRecord.fromSnapshot(s));

  static UnprocessedOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UnprocessedOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UnprocessedOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UnprocessedOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UnprocessedOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UnprocessedOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUnprocessedOrdersRecordData({
  DocumentReference? userID,
  DocumentReference? orderID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'orderID': orderID,
    }.withoutNulls,
  );

  return firestoreData;
}

class UnprocessedOrdersRecordDocumentEquality
    implements Equality<UnprocessedOrdersRecord> {
  const UnprocessedOrdersRecordDocumentEquality();

  @override
  bool equals(UnprocessedOrdersRecord? e1, UnprocessedOrdersRecord? e2) {
    return e1?.userID == e2?.userID && e1?.orderID == e2?.orderID;
  }

  @override
  int hash(UnprocessedOrdersRecord? e) =>
      const ListEquality().hash([e?.userID, e?.orderID]);

  @override
  bool isValidKey(Object? o) => o is UnprocessedOrdersRecord;
}
