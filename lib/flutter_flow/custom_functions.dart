import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double itemPrice(
  double price,
  int quantity,
) {
  return price * quantity;
}

double decrement(double price) {
  return price * -1;
}

double? totalSum(List<CartRecord>? document) {
  // calculate total price of items across all documents in the cart collection
  if (document == null || document.isEmpty) {
    return null;
  }

  double total = 0.0;
  for (final item in document) {
    total += item.sum;
  }

  return total;
}

DocumentReference? isFound(
  ProductsRecord productRef,
  List<CartRecord>? cart,
) {
  // check if the from reference is already in one of the cart documents
  for (final doc in cart ?? []) {
    if (doc.pharmacy == productRef.from) {
      return doc.reference;
    }
  }
  return null;
}

double? subSum(List<ItemsStruct>? items) {
  if (items == null) {
    return null;
  }

  double total = 0.0;
  for (final item in items) {
    total += item.price;
  }

  return total;
}

double? totaltotalSum(
  double appState,
  double totalSum,
) {
  double sum = 0;
  sum = appState + totalSum;
  return sum;
}
