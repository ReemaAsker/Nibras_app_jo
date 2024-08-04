import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:nibras_group_jor/features/company/company_info/data/file_conventar.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  /// The generated code assumes these values exist in JSON.
  final int? id;
  final String? company_name;
  final String? company_trademark;
  final int? company_title_id;
  final int? company_country_id;
  final int? company_type_id;
  final int? company_cat_id;
  final int? national_id;
  final String? registration_number;
  final String? phone;
  final String? mobile;
  final String? email;
  final String? notes;
  final int? a_address;
  final String? created_by;
  final String? updated_by;
  final String? address_desc;
  final String? deleted_by;
  final String? deleted_at;
  final String? created_at;
  final String? updated_at;
  @FileConverter()
  final dynamic picture;

  Company(
      {this.id,
      required this.company_name,
      required this.company_trademark,
      required this.company_title_id,
      required this.company_country_id,
      required this.company_type_id,
      required this.company_cat_id,
      required this.national_id,
      required this.registration_number,
      required this.phone,
      required this.mobile,
      required this.email,
      this.notes,
      required this.a_address,
      required this.picture,
      this.created_by,
      this.updated_by,
      required this.address_desc,
      this.deleted_by,
      this.deleted_at,
      this.created_at,
      this.updated_at});

  /// Connect the generated [_$CompanyFromJson] function to the `fromJson`
  /// factory.
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  /// Connect the generated [_$CompanyToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
