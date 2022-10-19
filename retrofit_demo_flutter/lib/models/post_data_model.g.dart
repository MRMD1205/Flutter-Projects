// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDataModel _$PostDataModelFromJson(Map<String, dynamic> json) =>
    PostDataModel(
      json['userId'] as int,
      json['title'] as String,
      json['body'] as String,
    )..id = json['id'] as int?;

Map<String, dynamic> _$PostDataModelToJson(PostDataModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.text,
    };
