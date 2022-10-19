import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  @JsonKey(name: 'SurveyPicId')
  int surveyPicId;
  @JsonKey(name: 'SurveyId')
  int surveyId;
  @JsonKey(name: 'PictureName')
  String? pictureName;
  @JsonKey(name: 'CreatedBy')
  int createdBy;

  ImageModel(this.surveyPicId, this.surveyId, this.pictureName, this.createdBy);

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
