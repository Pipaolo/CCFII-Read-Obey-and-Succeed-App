import 'dart:convert';

import 'package:flutter/services.dart';

class BibleRepository {
  Future<List<dynamic>> fetchRawDataFromJson(String directory) async {
    return await rootBundle
        .loadString(directory)
        .then((value) => jsonDecode(value));
  }

  Future<Map<String, dynamic>> fetchRawBookDataFromJson(
      String directory) async {
    return await rootBundle
        .loadString(directory)
        .then((value) => jsonDecode(value));
  }
}
