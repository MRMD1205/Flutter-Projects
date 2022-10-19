// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      json['SurveyPicId'] as int,
      json['SurveyId'] as int,
      json['PictureName'] as String?,
      json['CreatedBy'] as int,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'SurveyPicId': instance.surveyPicId,
      'SurveyId': instance.surveyId,
      'PictureName': instance.pictureName,
      'CreatedBy': instance.createdBy,
    };
