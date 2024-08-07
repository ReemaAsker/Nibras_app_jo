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
      national_id: (json['national_id'] as num?)?.toInt(),
      registration_number: json['registration_number'] as String?,
      phone: json['phone'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      notes: json['notes'] as String?,
      a_address: (json['a_address'] as num?)?.toInt(),
      picture: const FileConverter().fromJson(json['picture']),
      created_by: json['created_by'] as String?,
      updated_by: json['updated_by'] as String?,
      address_desc: json['address_desc'] as String?,
      deleted_by: json['deleted_by'] as String?,
      deleted_at: json['deleted_at'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
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
      'created_by': instance.created_by,
      'updated_by': instance.updated_by,
      'address_desc': instance.address_desc,
      'deleted_by': instance.deleted_by,
      'deleted_at': instance.deleted_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'picture': const FileConverter().toJson(instance.picture),
    };
