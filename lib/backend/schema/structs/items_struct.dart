// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsStruct extends FFFirebaseStruct {
  ItemsStruct({
    int? quantity,
    String? product,
    double? price,
    String? image,
    DocumentReference? productRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quantity = quantity,
        _product = product,
        _price = price,
        _image = image,
        _productRef = productRef,
        super(firestoreUtilData);

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "product" field.
  String? _product;
  String get product => _product ?? '';
  set product(String? val) => _product = val;
  bool hasProduct() => _product != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;
  bool hasProductRef() => _productRef != null;

  static ItemsStruct fromMap(Map<String, dynamic> data) => ItemsStruct(
        quantity: castToType<int>(data['quantity']),
        product: data['product'] as String?,
        price: castToType<double>(data['price']),
        image: data['image'] as String?,
        productRef: data['productRef'] as DocumentReference?,
      );

  static ItemsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'quantity': _quantity,
        'product': _product,
        'price': _price,
        'image': _image,
        'productRef': _productRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'product': serializeParam(
          _product,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'productRef': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemsStruct(
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        product: deserializeParam(
          data['product'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        productRef: deserializeParam(
          data['productRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
      );

  @override
  String toString() => 'ItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemsStruct &&
        quantity == other.quantity &&
        product == other.product &&
        price == other.price &&
        image == other.image &&
        productRef == other.productRef;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([quantity, product, price, image, productRef]);
}

ItemsStruct createItemsStruct({
  int? quantity,
  String? product,
  double? price,
  String? image,
  DocumentReference? productRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemsStruct(
      quantity: quantity,
      product: product,
      price: price,
      image: image,
      productRef: productRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemsStruct? updateItemsStruct(
  ItemsStruct? items, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    items
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemsStructData(
  Map<String, dynamic> firestoreData,
  ItemsStruct? items,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (items == null) {
    return;
  }
  if (items.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && items.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemsData = getItemsFirestoreData(items, forFieldValue);
  final nestedData = itemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = items.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemsFirestoreData(
  ItemsStruct? items, [
  bool forFieldValue = false,
]) {
  if (items == null) {
    return {};
  }
  final firestoreData = mapToFirestore(items.toMap());

  // Add any Firestore field values
  items.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemsListFirestoreData(
  List<ItemsStruct>? itemss,
) =>
    itemss?.map((e) => getItemsFirestoreData(e, true)).toList() ?? [];
