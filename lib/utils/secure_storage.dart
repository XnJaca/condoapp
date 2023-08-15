import 'dart:convert';

import 'package:condo_app/models/person.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _userKey = 'user_key';

  static Future<void> writeUser(Person user) async {
    final userJson = jsonEncode(user.toJson());
    await _storage.write(key: _userKey, value: userJson);
  }

  static Future<Person?> readUser() async {
    final userJson = await _storage.read(key: _userKey);

    if (userJson != null) {
      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      return Person.fromJson(userMap);
    }
    return null;
  }

  static Future<void> clearUser() async {
    await _storage.delete(key: _userKey);
  }
}
