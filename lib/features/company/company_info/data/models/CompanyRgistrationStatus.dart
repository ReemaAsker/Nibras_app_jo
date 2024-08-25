/*
Company registration status
*/

class CompanyRgistrationStatus {
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
}
