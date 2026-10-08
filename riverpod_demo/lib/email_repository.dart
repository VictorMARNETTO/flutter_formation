import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_repository.g.dart';

@riverpod
Future<bool> isEmailValid(Ref ref, String email) async {
  final res = await get(Uri.parse("https://www.disify.com/api/email/$email"));
  if (jsonDecode(res.body)
      case {"format": bool format, "disposable": bool disposable}
      when format && !disposable) {
    return true;
  }
  return false;
}
