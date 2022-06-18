import 'package:equatable/equatable.dart';

class destinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final double ratting;
  final int price;

  destinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imageUrl = '',
    this.ratting = 0.0,
    this.price = 0,
  });

  factory destinationModel.fromJson(String id, Map<String, dynamic> json) =>
      destinationModel(
        id: id,
        name: json['name'],
        city: json['city'],
        imageUrl: json['imageUrl'],
        ratting: json['ratting'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'imageUrl': imageUrl,
        'ratting': ratting,
        'price': price,
      };

  @override
  List<Object?> get props => [id, name, city, imageUrl, ratting, price];
}
