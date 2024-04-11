import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/data/model/routes.dart';

Future<Routes?> readJson() async {
  try {
    final response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    return Routes.fromJson(data);
  } catch (error) {
    debugPrint('Error loading data from sample.json file: $error');
    return null;
  }
}
