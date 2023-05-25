import 'dart:convert';
import '../shared/shared_values.dart';
import 'auth_service.dart';
import 'package:http/http.dart' as http;

class WalletService {
  Future<void> updatePin(String oldPin, String newPin) async {
    try {
      final token = await AuthService().getToken();
      final response = await http.put(
        Uri.parse('$baseUrl/wallets'),
        body: {
          'previous_pin': oldPin,
          'new_pin': newPin,
        },
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode != 200) {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
