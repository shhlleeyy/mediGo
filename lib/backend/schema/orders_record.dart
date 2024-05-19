import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "orderNumber" field.
  String? _orderNumber;
  String get orderNumber => _orderNumber ?? '';
  bool hasOrderNumber() => _orderNumber != null;

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "pharmacy" field.
  DocumentReference? _pharmacy;
  DocumentReference? get pharmacy => _pharmacy;
  bool hasPharmacy() => _pharmacy != null;

  // "items" field.
  List<ItemsStruct>? _items;
  List<ItemsStruct> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _orderNumber = snapshotData['orderNumber'] as String?;
    _totalPrice = castToType<double>(snapshotData['totalPrice']);
    _address = snapshotData['address'] as String?;
    _pharmacy = snapshotData['pharmacy'] as DocumentReference?;
    _items = getStructList(
      snapshotData['items'],
      ItemsStruct.fromMap,
    );
    _status = snapshotData['status'] as String?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('orders')
          : FirebaseFirestore.instance.collectionGroup('orders');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('orders').doc(id);

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? orderNumber,
  double? totalPrice,
  String? address,
  DocumentReference? pharmacy,
  String? status,
  DateTime? dateCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'orderNumber': orderNumber,
      'totalPrice': totalPrice,
      'address': address,
      'pharmacy': pharmacy,
      'status': status,
      'dateCreated': dateCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.orderNumber == e2?.orderNumber &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.address == e2?.address &&
        e1?.pharmacy == e2?.pharmacy &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.status == e2?.status &&
        e1?.dateCreated == e2?.dateCreated;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.orderNumber,
        e?.totalPrice,
        e?.address,
        e?.pharmacy,
        e?.items,
        e?.status,
        e?.dateCreated
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
