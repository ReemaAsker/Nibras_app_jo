// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  int? id;
  final String? company_name; //اسم الشركة
  final String? company_trademark; //العلامة التجارية
  final int? company_title_id; // وصف المسمى
  final int? company_country_id; //الجنسية
  final int? company_type_id; //صفة تسجيل المنشأة
  final int? company_cat_id; //نوع المنشأة
  final String? national_id; // الرقم الوطني
  final String? registration_number; // رقم تسجيل المنشأة
  String? phone;
  String? mobile;
  String? email;
  String? notes;
  int? a_address;
  String? address_desc;
  dynamic picture;
  dynamic created_by;
  dynamic updated_by;
  dynamic deleted_by;
  dynamic deleted_at;
  String? created_at;
  String? updated_at;
  String? fax;
  String? reg_r;

  Company({
    this.id,
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
    required this.address_desc,
    required this.picture,
    this.created_by,
    this.updated_by,
    this.deleted_by,
    this.deleted_at,
    this.created_at,
    this.updated_at,
    this.fax,
    this.reg_r,
  });

  /// Connect the generated [_$CompanyFromJson] function to the `fromJson`
  /// factory.
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  /// Connect the generated [_$CompanyToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  /// Connect the generated [_$CompanyToJson] function to the `toJson` method.
  Map<String, dynamic> toCreateJson() => _$toJsonCompanyCreate(this);
}
