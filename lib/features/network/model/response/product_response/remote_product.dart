



import 'package:ecomerce_app/features/network/model/response/category_response/remote_category.dart';
import 'package:ecomerce_app/features/network/model/response/product_response/brand.dart';

class RemoteProduct {
  int? sold;
  List<String>? images;
  List<RemoteCategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  double? price;
  String? imageCover;
  RemoteCategory? category;
  Brand? brand;
  double? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? priceAfterDiscount;
  List<String>? availableColors;

  RemoteProduct({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
   
    this.priceAfterDiscount,
    this.availableColors,
  });

  factory RemoteProduct.fromJson(Map<String, dynamic> json) => RemoteProduct(
    sold: json['sold'] as int?,
    images: json['images'] as List<String>?,
    subcategory: (json['subcategory'] as List<dynamic>?)
        ?.map((e) => RemoteCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    ratingsQuantity: json['ratingsQuantity'] as int?,
    id: json['_id'] as String?,
    title: json['title'] as String?,
    slug: json['slug'] as String?,
    description: json['description'] as String?,
    quantity: json['quantity'] as int?,
    price: json['price'] as double?,
    imageCover: json['imageCover'] as String?,
    category: json['category'] == null
        ? null
        : RemoteCategory.fromJson(json['category'] as Map<String, dynamic>),
    brand: json['brand'] == null
        ? null
        : Brand.fromJson(json['brand'] as Map<String, dynamic>),
    ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
   
    priceAfterDiscount: json['priceAfterDiscount'] as double?,
    availableColors: json['availableColors'] as List<String>?,
  );

  Map<String, dynamic> toJson() => {
    'sold': sold,
    'images': images,
    'subcategory': subcategory?.map((e) => e.toJson()).toList(),
    'ratingsQuantity': ratingsQuantity,
    '_id': id,
    'title': title,
    'slug': slug,
    'description': description,
    'quantity': quantity,
    'price': price,
    'imageCover': imageCover,
    'category': category?.toJson(),
    'brand': brand?.toJson(),
    'ratingsAverage': ratingsAverage,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'id': id,
    'priceAfterDiscount': priceAfterDiscount,
    'availableColors': availableColors,
  };
}
