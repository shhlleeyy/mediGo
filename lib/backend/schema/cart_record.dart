import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "items" field.
  List<ItemsStruct>? _items;
  List<ItemsStruct> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "sum" field.
  double? _sum;
  double get sum => _sum ?? 0.0;
  bool hasSum() => _sum != null;

  // "pharmacy" field.
  DocumentReference? _pharmacy;
  DocumentReference? get pharmacy => _pharmacy;
  bool hasPharmacy() => _pharmacy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _items = getStructList(
      snapshotData['items'],
      ItemsStruct.fromMap,
    );
    _sum = castToType<double>(snapshotData['sum']);
    _pharmacy = snapshotData['pharmacy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cart')
          : FirebaseFirestore.instance.collectionGroup('cart');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cart').doc(id);

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartRecordData({
  double? sum,
  DocumentReference? pharmacy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sum': sum,
      'pharmacy': pharmacy,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartRecordDocumentEquality implements Equality<CartRecord> {
  const CartRecordDocumentEquality();

  @override
  bool equals(CartRecord? e1, CartRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.items, e2?.items) &&
        e1?.sum == e2?.sum &&
        e1?.pharmacy == e2?.pharmacy;
  }

  @override
  int hash(CartRecord? e) =>
      const ListEquality().hash([e?.items, e?.sum, e?.pharmacy]);

  @override
  bool isValidKey(Object? o) => o is CartRecord;
}
