import 'package:kt_dart/collection.dart';

class HomeModel {
  final int? id;
  final double? price;
  final String? title;
  final String? description;
  final String? category;
  final String? image;

  HomeModel({
    this.id,
    this.price,
    this.title,
    this.description,
    this.category,
    this.image,
  });

  HomeModel copyWith({
    int? id = 0,
    double? price = 0,
    String? title = '',
    String? description ='',
    String? category = '',
    String? image = '',
  }) {
    return HomeModel(
      id: id ?? this.id,
      price: price ?? this.price,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
    );
  }

  factory HomeModel.clone(HomeModel source) {
    return HomeModel(
      id: source.id,
      price: source.price,
      title: source.title,
      description: source.description,
      category: source.category,
      image: source.image,
    );
  }
}
