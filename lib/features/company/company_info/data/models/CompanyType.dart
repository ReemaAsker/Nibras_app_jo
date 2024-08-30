import 'package:nibras_group_jor/core/interfaces/droppable.dart';

class CompanyType extends Droppable {
  int id;
  String type;

  CompanyType({
    required this.id,
    required this.type,
  });

  // Convert a CompanyType object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
    };
  }

  // Create a CompanyType object from a JSON map
  factory CompanyType.fromJson(Map<String, dynamic> json) {
    return CompanyType(
      id: json['id'],
      type: json['type'],
    );
  }

  @override
  String getDropValue() => type;

  @override
  String getId() => id.toString();
}
