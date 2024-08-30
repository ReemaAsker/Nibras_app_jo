import '../../../../../core/interfaces/droppable.dart';

class CompanyTitle extends Droppable {
  int? id;
  String? titlePrefix;
  String? titleSuffix;

  CompanyTitle({this.id, this.titlePrefix, this.titleSuffix});

  CompanyTitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titlePrefix = json['title_prefix'];
    titleSuffix = json['title_suffix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_prefix'] = this.titlePrefix;
    data['title_suffix'] = this.titleSuffix;
    return data;
  }

  @override
  String getDropValue() {
    if (titleSuffix == null) {
      return titlePrefix ?? "";
    }
    return "$titlePrefix, $titleSuffix";
  }

  @override
  String getId() => id?.toString() ?? "";
}
