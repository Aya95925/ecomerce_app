class Products {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final double? priceAfterDiscount;
  final String? imageCover;
  final List<String>? images;
  final String? categoryId;
  final String? brandId;
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final int? quantity;
  final List<String>? availableColors;

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.priceAfterDiscount,
    required this.imageCover,
    required this.images,
    required this.categoryId,
    required this.brandId,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.quantity,
    required this.availableColors,
  });
}
