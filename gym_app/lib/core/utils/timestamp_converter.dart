import 'package:cloud_firestore/cloud_firestore.dart';

Timestamp timestampFromJson(dynamic json) {
  if (json is Timestamp) return json;
  if (json is String) return Timestamp.fromDate(DateTime.parse(json));
  if (json is int) return Timestamp.fromMillisecondsSinceEpoch(json);
  return Timestamp.now();
}

dynamic timestampToJson(Timestamp timestamp) => timestamp.toDate().toIso8601String();
