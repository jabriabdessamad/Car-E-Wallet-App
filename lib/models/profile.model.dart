import 'package:json_annotation/json_annotation.dart';

part 'profile.model.g.dart';

@JsonSerializable()
class ProfileModel {
  String? username;
  String? email;
  String? phonenumber;

  ProfileModel(this.username, this.email, this.phonenumber);

  factory ProfileModel.fromJson(Map<String, dynamic> data) =>
      _$ProfileModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
