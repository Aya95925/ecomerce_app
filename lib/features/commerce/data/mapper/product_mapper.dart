import 'package:ecomerce_app/features/commerce/domain/models/product.dart';
import 'package:ecomerce_app/features/network/model/response/product_response/remote_product.dart';

extension Product on RemoteProduct {
  Products toProduct() {
    return Products(
      id: id,
      title: title,
      description: description,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      imageCover: imageCover,
      images: images,
      categoryId: category?.id ?? '',
      brandId: brand?.id ?? '',
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      quantity: quantity,
      availableColors: availableColors,
    );
  }
}
