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
  Company({
    this.id,
    required this.picture,
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
    this.created_by,
    this.updated_by,
    required this.address_desc,
    this.deleted_by,
    this.deleted_at,
    this.created_at,
    this.updated_at,
  });

  /// Connect the generated [_$CompanyFromJson] function to the `fromJson`
  /// factory.
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  /// Connect the generated [_$CompanyToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
