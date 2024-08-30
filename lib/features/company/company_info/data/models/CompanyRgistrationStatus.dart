/*
Company registration status
*/

import 'package:nibras_group_jor/core/interfaces/droppable.dart';

class CompanyRgistrationStatus extends Droppable {
  int? id;
  String? compType;
  String? compDesc;

  CompanyRgistrationStatus({this.id, this.compType, this.compDesc});

  CompanyRgistrationStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    compType = json['comp_type'];
    compDesc = json['comp_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comp_type'] = this.compType;
    data['comp_desc'] = this.compDesc;
    return data;
  }

  @override
  String? getDescription() => compDesc;

  @override
  String getDropValue() => compType ?? '';

  @override
  String getId() => id?.toString() ?? '';
}
