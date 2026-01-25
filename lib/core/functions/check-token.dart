
import 'dart:convert';

bool isTokenExpired(String token) {
  try {
    final parts = token.split('.');
    if (parts.length != 3) return true;

    final payload = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1])))
    );

    final exp = payload['exp'];
    final expiryDate =
    DateTime.fromMillisecondsSinceEpoch(exp * 1000);

    return DateTime.now().isAfter(expiryDate);
  } catch (_) {
    return true;
  }
}
