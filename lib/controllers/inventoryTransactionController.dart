import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

import '../models/TransactionModel.dart';
import '../utils/storage_keys.dart';

class InventoryTransactionController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GetStorage _box = GetStorage();

  /// Safely read current user from GetStorage
  Map<String, dynamic>? _getCurrentUser() {
    try {
      final raw = _box.read(StorageKeys.session);
      if (raw == null || raw is! Map) return null;
      return Map<String, dynamic>.from(raw);
    } catch (e) {
      // Never allow storage corruption to crash logging
      return null;
    }
  }

  /// Log inventory-related transaction
  /// ⚠️ This function MUST NEVER throw
  Future<void> log({
    required TransactionType type,
    required String itemId,
    required String itemName,
    int? quantity,
    DateTime? expiry,
    String source = 'ONLINE',
  }) async {
    final user = _getCurrentUser();

    final payload = {
      // transaction
      'type': type.name.toUpperCase(),

      // item
      'itemId': itemId,
      'itemName': itemName,
      'quantity': quantity,
      'expiry': expiry?.toIso8601String(),

      // user (nullable-safe)
      'userId': user?['id'],
      'userName': user?['fullName'],
      'userRole': _safeRole(user?['role']),

      // meta
      'source': source,
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      await _firestore.collection('transactions').add(payload);
      // debugPrint('🧾 Transaction logged: ${type.name}');
    } catch (e) {
      // ❗ Swallow error to protect inventory logic
      // debugPrint('⚠️ Transaction log failed: $e');
    }
  }

  /// Ensures role is stored as STRING (Firestore-safe)
  String? _safeRole(dynamic role) {
    if (role == null) return null;
    if (role is String) return role;
    if (role is Map && role['name'] != null) return role['name'];
    return role.toString();
  }
}
