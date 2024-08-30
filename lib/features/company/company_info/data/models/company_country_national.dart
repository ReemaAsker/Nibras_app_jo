import 'package:nibras_group_jor/core/interfaces/droppable.dart';

class CompanyCountryNational extends Droppable {
  int? id;
  String? countryDes;
  String? nationalityDes;

  CompanyCountryNational({this.id, this.countryDes, this.nationalityDes});

  CompanyCountryNational.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryDes = json['country_des'];
    nationalityDes = json['nationality_des'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_des'] = this.countryDes;
    data['nationality_des'] = this.nationalityDes;
    return data;
  }

  @override
  String getDropValue() => nationalityDes ?? "";

  @override
  String getId() => id.toString();
}
