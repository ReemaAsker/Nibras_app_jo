// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companyInfoFromApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfoFromApi _$CompanyInfoFromApiFromJson(Map<String, dynamic> json) =>
    CompanyInfoFromApi(
      id: (json['id'] as num).toInt(),
      companyName: json['company_name'] as String,
    );

Map<String, dynamic> _$CompanyInfoFromApiToJson(CompanyInfoFromApi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_name': instance.companyName,
    };
