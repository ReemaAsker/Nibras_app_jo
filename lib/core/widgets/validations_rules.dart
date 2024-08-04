import 'package:email_validator/email_validator.dart';

// Email validation function
String? emailValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "* مطلوب"; // Required
  }
  if (!EmailValidator.validate(value)) {
    return "الايميل غير صحيح"; // Invalid email
  }
  return null;
}

// Password validation function
String? passwordValidation(String? value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value == null || value.isEmpty) {
    return "* مطلوب"; // Required
  }
  if (!regex.hasMatch(value)) {
    return 'ادخل كلمة قوية من حروف وارقام ورموز'; // Password strength
  }
  return null;
}

// Checks if the value is empty or null
bool emptyNullValidation(String? value) {
  return value == null || value.isEmpty;
}

// Number validation function
String? numberValidation(String? value) {
  if (value == null || value.isEmpty) {
    return '* مطلوب'; // Required
  }
  String pattern = r'^(?:[+0][1-9])?[0-9]{1,}$';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'ارقام فقط.'; // Must be numbers only
  }
  return null;
}

// phone Number validation function (10 digits)
String? phonenumberValidation(String? value) {
  if (value == null || value.isEmpty) {
    return '* مطلوب'; // Required
  }
  String pattern = r'^(?:[+0][1-9])?[0-9]{10}$';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'رقم الموبايل يجب ان يكون مكون من 10 خانات'; // Must be numbers only
  }
  return null;
}

// Telephone Number validation function (10 digits)
String? telePhonenumberValidation(String? value) {
  if (value == null || value.isEmpty) {
    return '* مطلوب'; // Required
  }
  String pattern = r'^(?:[+0][1-9])?[0-9]{9}$';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'رقم الهاتف يجب ان يكون مكون من 9 خانات'; // Must be numbers only
  }
  return null;
}

String? numberGreaterThanFourValidation(String? value) {
  if (value == null || value.isEmpty) {
    return '* مطلوب'; // Required
  }
  String pattern = r'^(?:[+0][1-9])?[0-9]{4,}$';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'يجب ان يكون ارقام  واكثر من 3 خانات..'; // Must be numbers only
  }
  return null;
}

String? IsTextEmpty(String? value) {
  if (emptyNullValidation(value)) {
    return '* مطلوب'; // Required
  } else {
    return null;
  }
}

String? validateDropdown(String? value) {
  if (emptyNullValidation(value)) {
    return '* مطلوب';
  }
  return null;
}
