import 'package:ecomerce_app/features/commerce/domain/models/category.dart';
import 'package:ecomerce_app/features/network/model/response/category_response/remote_category.dart';

extension CategoryMapper on RemoteCategory {
  Category toCategory() {
    return Category(
      id: id,
      name: name,
      image: image,
      slug: slug,
      category: category,
    );
  }
}
