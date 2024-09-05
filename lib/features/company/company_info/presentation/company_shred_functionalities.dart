import 'package:flutter/material.dart';

Map<String, String> splitCompanyName(String input) {
  // Define the regular expressions to extract the required parts
  final RegExp prefixRegex = RegExp(r'\(([^)]+)\)');
  final RegExp suffixRegex = RegExp(r'\(([^)]+)\)$');

  // Extract the prefix part from parentheses at the beginning
  String prefix = '';
  final prefixMatch = prefixRegex.firstMatch(input);
  if (prefixMatch != null) {
    prefix = prefixMatch.group(1)!.trim();
  }

  // Extract the suffix part from parentheses at the end
  String suffix = '';
  final suffixMatch = suffixRegex.firstMatch(input);
  if (suffixMatch != null) {
    suffix = suffixMatch.group(1)!.trim();
  }

  // Extract the name part (the remaining text between the parentheses)
  String comName =
      input.replaceAll(prefixRegex, '').replaceAll(suffixRegex, '').trim();

  // Remove the extra spaces around parentheses if they are present
  if (prefix.isEmpty) {
    comName = comName.replaceAll(RegExp(r'\s*\(\s*\)'), '');
  }
  if (suffix.isEmpty) {
    comName = comName.replaceAll(RegExp(r'\s*\(\s*\)$'), '');
  }

  return {
    'prefix': prefix,
    'ComName': comName,
    'suffix': suffix,
  };
}

void showSnackbar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
    duration: Duration(milliseconds: 200),
  ));
}
