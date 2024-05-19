import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "brandName" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  // "genericName" field.
  String? _genericName;
  String get genericName => _genericName ?? '';
  bool hasGenericName() => _genericName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  bool hasStock() => _stock != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "type" field.
  DocumentReference? _type;
  DocumentReference? get type => _type;
  bool hasType() => _type != null;

  // "from" field.
  DocumentReference? _from;
  DocumentReference? get from => _from;
  bool hasFrom() => _from != null;

  // "productType" field.
  String? _productType;
  String get productType => _productType ?? '';
  bool hasProductType() => _productType != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _brandName = snapshotData['brandName'] as String?;
    _genericName = snapshotData['genericName'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _stock = castToType<int>(snapshotData['stock']);
    _image = snapshotData['image'] as String?;
    _type = snapshotData['type'] as DocumentReference?;
    _from = snapshotData['from'] as DocumentReference?;
    _productType = snapshotData['productType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  String? brandName,
  String? genericName,
  String? description,
  double? price,
  int? stock,
  String? image,
  DocumentReference? type,
  DocumentReference? from,
  String? productType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'brandName': brandName,
      'genericName': genericName,
      'description': description,
      'price': price,
      'stock': stock,
      'image': image,
      'type': type,
      'from': from,
      'productType': productType,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.brandName == e2?.brandName &&
        e1?.genericName == e2?.genericName &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.stock == e2?.stock &&
        e1?.image == e2?.image &&
        e1?.type == e2?.type &&
        e1?.from == e2?.from &&
        e1?.productType == e2?.productType;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.brandName,
        e?.genericName,
        e?.description,
        e?.price,
        e?.stock,
        e?.image,
        e?.type,
        e?.from,
        e?.productType
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
