// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_PostModel _$_$_PostModelFromJson(Map<String, dynamic> json) {
  return _$_PostModel(
    userId: json['userId'] as int?,
    id: json['id'] as int?,
    title: json['title'] as String?,
    body: json['body'] as String?,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
