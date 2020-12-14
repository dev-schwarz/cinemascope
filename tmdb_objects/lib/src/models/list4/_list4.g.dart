// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_list4.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

List4<T> _$List4FromJson<T extends ResumedMedia>(Map<String, dynamic> json) {
  return List4<T>(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    iso_639_1: json['iso_639_1'] as String,
    iso_3166_1: json['iso_3166_1'] as String,
    public: json['public'] as bool,
    revenue: json['revenue'] as int,
    runtime: json['runtime'] as int,
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    averageRating: (json['average_rating'] as num)?.toDouble(),
    createdBy: json['created_by'] == null
        ? null
        : List4CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
    results: (json['results'] as List)
        ?.map(ResumedMediaConverter<T>().fromJson)
        ?.toList(),
  );
}

Map<String, dynamic> _$List4ToJson<T extends ResumedMedia>(List4<T> instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'iso_639_1': instance.iso_639_1,
      'iso_3166_1': instance.iso_3166_1,
      'public': instance.public,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'average_rating': instance.averageRating,
      'created_by': instance.createdBy,
      'results':
          instance.results?.map(ResumedMediaConverter<T>().toJson)?.toList(),
    };

List4CreatedBy _$List4CreatedByFromJson(Map<String, dynamic> json) {
  return List4CreatedBy(
    name: json['name'] as String,
    username: json['username'] as String,
    gravatarHash: json['gravatar_hash'] as String,
  );
}

Map<String, dynamic> _$List4CreatedByToJson(List4CreatedBy instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'gravatar_hash': instance.gravatarHash,
    };

List4AddItems _$List4AddItemsFromJson(Map<String, dynamic> json) {
  return List4AddItems(
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
    success: json['success'] as bool,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : List4ChangeListResults.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$List4AddItemsToJson(List4AddItems instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'success': instance.success,
      'results': instance.results,
    };

List4CheckItemStatus _$List4CheckItemStatusFromJson(Map<String, dynamic> json) {
  return List4CheckItemStatus(
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
    success: json['success'] as bool,
    id: json['id'] as int,
    mediaId: json['media_id'] as int,
    mediaType: TMediaType.fromJson(json['media_type'] as String),
  );
}

Map<String, dynamic> _$List4CheckItemStatusToJson(
        List4CheckItemStatus instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'success': instance.success,
      'id': instance.id,
      'media_id': instance.mediaId,
      'media_type': TMediaType.toJson(instance.mediaType),
    };

List4Create _$List4CreateFromJson(Map<String, dynamic> json) {
  return List4Create(
    id: json['id'] as int,
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$List4CreateToJson(List4Create instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'success': instance.success,
    };

List4Delete _$List4DeleteFromJson(Map<String, dynamic> json) {
  return List4Delete(
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$List4DeleteToJson(List4Delete instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'success': instance.success,
    };

List4ChangeListResults _$List4ChangeListResultsFromJson(
    Map<String, dynamic> json) {
  return List4ChangeListResults(
    mediaId: json['media_id'] as int,
    mediaType: TMediaType.fromJson(json['media_type'] as String),
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$List4ChangeListResultsToJson(
        List4ChangeListResults instance) =>
    <String, dynamic>{
      'media_id': instance.mediaId,
      'media_type': TMediaType.toJson(instance.mediaType),
      'success': instance.success,
    };

List4ListItem _$List4ListItemFromJson(Map<String, dynamic> json) {
  return List4ListItem(
    mediaId: json['media_id'] as int,
    mediaType: TMediaType.fromJson(json['media_type'] as String),
  );
}

Map<String, dynamic> _$List4ListItemToJson(List4ListItem instance) =>
    <String, dynamic>{
      'media_id': instance.mediaId,
      'media_type': TMediaType.toJson(instance.mediaType),
    };

List4RemoveItems _$List4RemoveItemsFromJson(Map<String, dynamic> json) {
  return List4RemoveItems(
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
    success: json['success'] as bool,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : List4ChangeListResults.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$List4RemoveItemsToJson(List4RemoveItems instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'success': instance.success,
      'results': instance.results,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$List4ToString(List4 o) {
  return """List4{
  page: ${o.page},
  totalPages: ${o.totalPages},
  totalResults: ${o.totalResults},
  results: ${o.results},
  id: ${o.id},
  name: ${o.name},
  description: ${o.description},
  iso_639_1: ${o.iso_639_1},
  iso_3166_1: ${o.iso_3166_1},
  public: ${o.public},
  revenue: ${o.revenue},
  runtime: ${o.runtime},
  posterPath: ${o.posterPath},
  backdropPath: ${o.backdropPath},
  averageRating: ${o.averageRating},
  createdBy: ${o.createdBy.toString().split("\n").join("\n  ")},
  results: ${o.results},
}""";
}

String _$List4CreatedByToString(List4CreatedBy o) {
  return """List4CreatedBy{
  name: ${o.name},
  username: ${o.username},
  gravatarHash: ${o.gravatarHash},
}""";
}

String _$List4AddItemsToString(List4AddItems o) {
  return """List4AddItems{
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
  success: ${o.success},
  results: ${o.results},
}""";
}

String _$List4CheckItemStatusToString(List4CheckItemStatus o) {
  return """List4CheckItemStatus{
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
  success: ${o.success},
  id: ${o.id},
  mediaId: ${o.mediaId},
  mediaType: ${o.mediaType},
}""";
}

String _$List4CreateToString(List4Create o) {
  return """List4Create{
  id: ${o.id},
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
  success: ${o.success},
}""";
}

String _$List4DeleteToString(List4Delete o) {
  return """List4Delete{
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
  success: ${o.success},
}""";
}

String _$List4ChangeListResultsToString(List4ChangeListResults o) {
  return """List4ChangeListResults{
  mediaId: ${o.mediaId},
  mediaType: ${o.mediaType},
  success: ${o.success},
}""";
}

String _$List4ListItemToString(List4ListItem o) {
  return """List4ListItem{
  mediaId: ${o.mediaId},
  mediaType: ${o.mediaType},
}""";
}

String _$List4RemoveItemsToString(List4RemoveItems o) {
  return """List4RemoveItems{
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
  success: ${o.success},
  results: ${o.results},
}""";
}
