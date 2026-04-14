import 'remote_category.dart';
import '../metadata.dart';

class RemoteCategoryResponse {
  int? results;
  Metadata? metadata;
  List<RemoteCategory>? category;

  RemoteCategoryResponse({this.results, this.metadata, this.category});

  factory RemoteCategoryResponse.fromJson(Map<String, dynamic> json) {
    return RemoteCategoryResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      category: (json['data'] as List<dynamic>?)
          ?.map((e) => RemoteCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'results': results,
    'metadata': metadata?.toJson(),
    'data': category?.map((e) => e.toJson()).toList(),
  };
}
