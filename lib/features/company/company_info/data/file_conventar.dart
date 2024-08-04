import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart'; // Needed for kIsWeb
import 'package:json_annotation/json_annotation.dart';

class FileConverter implements JsonConverter<dynamic, dynamic> {
  const FileConverter();
  @override
  dynamic fromJson(dynamic json) {
    if (kIsWeb) {
      return Uint8List.fromList(
          json.codeUnits); // Web: Convert String to Uint8List
    } else {
      return File(json); // Mobile: Convert path to File
    }
  }

  @override
  dynamic toJson(dynamic file) {
    if (file is File) {
      return file.path; // Mobile: Convert File to path
    } else if (file is Uint8List) {
      return file; // Web: Return Uint8List directly
    } else {
      throw Exception('Invalid file data');
    }
  }
}
