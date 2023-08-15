import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductDataModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  ProductDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  ProductDataModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? image,
  }) {
    return ProductDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  factory ProductDataModel.fromMap(Map<String, dynamic> map) {
    return ProductDataModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDataModel.fromJson(String source) =>
      ProductDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDataModel(id: $id, name: $name, description: $description, price: $price, image: $image)';
  }

  @override
  bool operator ==(covariant ProductDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        image.hashCode;
  }
}
