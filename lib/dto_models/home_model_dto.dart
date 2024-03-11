import 'dart:convert';

import '../feature/models/home_model.dart';
import '../helpers/mapper.dart';

List<HomeModelDto> homeModelDtoFromJson(String str) => List<HomeModelDto>.from(json.decode(str).map((x) => HomeModelDto.fromJson(x)));

String homeModelDtoToJson(List<HomeModelDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class HomeModelDto implements Mapper<HomeModelDto, HomeModel>{
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;

  HomeModelDto({
   this.id,
   this.title,
   this.price,
   this.description,
   this.category,
   this.image,
  });

  HomeModelDto copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
  }) =>
      HomeModelDto(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
      );

  factory HomeModelDto.fromJson(Map<String, dynamic> json) => HomeModelDto(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
  };

  @override
  HomeModel call(HomeModelDto object) {
    return HomeModel(
      id: object.id,
      price: object.price,
      title: object.title,
      description: object.description,
      category: object.category,
      image: object.image,
    );
  }

  @override
  String toString() {
    return 'OrgIDModelDto{id: $id,title: $title, price: $price, description: $description, category: $category,image: $image,}';
  }


}

