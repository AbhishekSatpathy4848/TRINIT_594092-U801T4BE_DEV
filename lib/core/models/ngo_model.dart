import 'package:ngo_hackathon/core/models/community_model.dart';
import 'package:ngo_hackathon/core/models/news_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'ngo_model.g.dart';

@JsonSerializable()
class NgoModel {
  String? name;
  String? description;
  String? profilePhoto;
  List<String>? photos;
  String? type;
  List<String>? fieldsOfImpact;
  List<String>? previousWork;
  List<List<String>>?
      currentGoals; //first element is the goal and the next is the method of achieving it
  String? impactOnEnvironment;
  int? followerCount;
  int? fundingNeeds;
  String? city;
  String? state;
  List<String>? phoneNumbers;
  List<String>? emails;
  String? community;
  List<String>? news;
  String? mission;
  bool? firstTimeLogin;

  NgoModel(
      {required this.name,
      required this.description,
      required this.profilePhoto,
      required this.photos,
      required this.type,
      required this.fieldsOfImpact,
      required this.previousWork,
      required this.currentGoals,
      required this.impactOnEnvironment,
      required this.followerCount,
      required this.fundingNeeds,
      required this.city,
      required this.state,
      required this.phoneNumbers,
      required this.emails,
      required this.community,
      required this.news,
      required this.mission,
      required this.firstTimeLogin});

  Future createNgo(NgoModel ngo) async {
    final docNgo = FirebaseFirestore.instance.collection('Ngo').doc(ngo.name);

    await docNgo.set(ngo.toJson());
  }

  factory NgoModel.fromJson(Map<String, dynamic> json) =>
      _$NgoModelFromJson(json);

  Map<String, dynamic> toJson() => _$NgoModelToJson(this);
}
