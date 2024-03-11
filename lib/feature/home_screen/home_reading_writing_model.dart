
class HomeReadingWritingModel {
  final int? id;
  final double? price;
  final String? title;
  final String? description;
  final String? category;
  final String? image;

  HomeReadingWritingModel({
    this.id,
    this.price,
    this.title,
    this.description,
    this.category,
    this.image,
  });

  HomeReadingWritingModel copyWith({
    int? id,
    double? price,
    String? title,
    String? description,
    String? category,
    String? image,
  }) =>
      HomeReadingWritingModel(
        id: id ?? this.id,
        price: price ?? this.price,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
      );

// factory LoginReadingWritingModel.fromJson(Map<String, dynamic> json) => LoginReadingWritingModel(
//   email: json["email"],
//   password: json["password"],
// );
//
// Map<String, dynamic> toJson() => {
//   "email": email,
//   "password": password,
// };
}
