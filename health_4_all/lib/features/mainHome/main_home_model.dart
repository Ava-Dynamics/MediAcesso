class UBSModel {
  final String name;
  final String location;

  UBSModel({required this.name, required this.location});

  factory UBSModel.fromJson(Map<String, dynamic> json) {
    return UBSModel(
      name: json['name'] ?? '',
      location: json['location'] ?? '',
    );
  }
}
