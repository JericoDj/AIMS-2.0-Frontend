import 'package:cloud_firestore/cloud_firestore.dart';

enum TransactionType {
  createItem,
  addStock,
  dispense,
  deleteItem,
  sync,
}

class InventoryTransaction {
  final String id;
  final TransactionType type;
  final String itemId;
  final String itemName;
  final int? quantity;
  final DateTime? expiry;
  final String source;
  final DateTime timestamp;

  InventoryTransaction({
    required this.id,
    required this.type,
    required this.itemId,
    required this.itemName,
    this.quantity,
    this.expiry,
    required this.source,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type.name.toUpperCase(),
      'itemId': itemId,
      'itemName': itemName,
      'quantity': quantity,
      'expiry': expiry?.toIso8601String(),
      'source': source,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}
