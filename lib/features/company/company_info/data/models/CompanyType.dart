class CompanyType {
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
}
