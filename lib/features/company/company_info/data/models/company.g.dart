// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: (json['id'] as num?)?.toInt(),
      company_name: json['company_name'] as String?,
      company_trademark: json['company_trademark'] as String?,
      company_title_id: (json['company_title_id'] as num?)?.toInt(),
      company_country_id: (json['company_country_id'] as num?)?.toInt(),
      company_type_id: (json['company_type_id'] as num?)?.toInt(),
      company_cat_id: (json['company_cat_id'] as num?)?.toInt(),
      national_id: json['national_id'] as String?,
      registration_number: json['registration_number'] as String?,
      phone: json['phone'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      notes: json['notes'] as String?,
      a_address: (json['a_address'] as num?)?.toInt(),
      address_desc: json['address_desc'] as String?,
      picture: json['picture'],
      created_by: json['created_by'],
      updated_by: json['updated_by'],
      // deleted_by: json['deleted_by'],
      // deleted_at: json['deleted_at'],
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      fax: json['fax'] as String?,
      reg_r: json['reg_r'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'company_name': instance.company_name,
      'company_trademark': instance.company_trademark,
      'company_title_id': instance.company_title_id,
      'company_country_id': instance.company_country_id,
      'company_type_id': instance.company_type_id,
      'company_cat_id': instance.company_cat_id,
      'national_id': instance.national_id,
      'registration_number': instance.registration_number,
      'phone': instance.phone,
      'mobile': instance.mobile,
      'email': instance.email,
      'notes': instance.notes,
      'a_address': instance.a_address,
      'address_desc': instance.address_desc,
      'picture': instance.picture,
      'fax': instance.fax,
      'reg_r': instance.reg_r,
    };

Map<String, dynamic> _$toJsonCompanyCreate(Company instance) =>
    <String, dynamic>{
      'company_name': instance.company_name,
      'company_trademark': instance.company_trademark,
      'company_title_id': instance.company_title_id,
      'company_country_id': instance.company_country_id,
      'company_type_id': instance.company_type_id,
      'company_cat_id': instance.company_cat_id,
      'national_id': instance.national_id,
      'registration_number': instance.registration_number,
      'phone': instance.phone,
      'mobile': instance.mobile,
      'email': instance.email,
      'notes': instance.notes,
      'a_address': instance.a_address,
      'address_desc': instance.address_desc,
      'picture': instance.picture,
      'fax': instance.fax,
      'reg_r': instance.reg_r,
    };
