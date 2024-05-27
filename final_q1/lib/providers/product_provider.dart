import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

final statusFilterProvider = StateProvider<String>((ref) => 'Processing');

final productProvider = StreamProvider.autoDispose<List<Product>>(
  (ref) {
    final status = ref.watch(statusFilterProvider);
    final firestore = FirebaseFirestore.instance;
    final collection = firestore.collection('products').where("category", isEqualTo: status);
    return collection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Product.fromJson(doc.data()))
        .toList());
  },
);