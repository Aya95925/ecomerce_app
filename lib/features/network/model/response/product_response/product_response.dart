




import 'package:ecomerce_app/features/network/model/response/metadata.dart';
import 'package:ecomerce_app/features/network/model/response/product_response/remote_product.dart';

class ProductResponse {
  int? results;
  Metadata? metadata;
  List<RemoteProduct>? product;

  ProductResponse({this.results, this.metadata, this.product});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      product: (json['data'] as List<dynamic>?)
          ?.map((e) =>RemoteProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'results': results,
    'metadata': metadata?.toJson(),
    'data': product?.map((e) => e.toJson()).toList(),
  };
}
