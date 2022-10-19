import 'package:json_annotation/json_annotation.dart';

part 'post_data_model.g.dart';

@JsonSerializable()
class PostDataModel {
  int userId;
  int? id;
  String title;
  @JsonKey(name: "body")
  String text;

  PostDataModel(this.userId, this.title, this.text);

  factory PostDataModel.fromJson(Map<String, dynamic> json) =>
      _$PostDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataModelToJson(this);
}
