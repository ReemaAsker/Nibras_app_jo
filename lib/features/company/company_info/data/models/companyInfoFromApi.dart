import 'package:json_annotation/json_annotation.dart';

part 'companyInfoFromApi.g.dart';

@JsonSerializable()
class CompanyInfoFromApi {
  final int id;
  @JsonKey(name: 'company_name')
  final String companyName;

  CompanyInfoFromApi({
    required this.id,
    required this.companyName,
  });

  factory CompanyInfoFromApi.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoFromApiFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyInfoFromApiToJson(this);
}
