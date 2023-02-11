import 'package:ngo_hackathon/core/models/community_model.dart';
import 'package:ngo_hackathon/core/models/ngo_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'philanthropist_model.g.dart';

@JsonSerializable()
class PhilanthropistModel {
  String? name;
  String? email;
  String? phoneNo;
  String? profilePhoto;
  List<String>? preferredAreaofimpact;
  List<String>? followingNgo;
  String? city;
  String? state;
  List<String>? communities;
  String? description;
  bool? firstTimeLogin;

  PhilanthropistModel(
      {required this.name,
      required this.email,
      required this.phoneNo,
      required this.profilePhoto,
      required this.preferredAreaofimpact,
      required this.followingNgo,
      required this.city,
      required this.state,
      required this.communities,
      required this.description,
      required this.firstTimeLogin});

  Future createPhilanthropist(PhilanthropistModel philanthropist) async {
    final docPhil = await FirebaseFirestore.instance
        .collection('Philanthropist')
        .doc(philanthropist.email)
        .set(philanthropist.toJson());
  }

  factory PhilanthropistModel.fromJson(Map<String, dynamic> json) =>
      _$PhilanthropistModelFromJson(json);

  /// Connect the generated [_$PhilanthropistModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PhilanthropistModelToJson(this);
}
