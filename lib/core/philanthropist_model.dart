import 'package:ngo_hackathon/core/community_model.dart';
import 'package:ngo_hackathon/core/ngo_model.dart';

class PhilanthropistModel {
  String? name;
  String? email;
  String? phoneNo;
  String? profilePhoto;
  List<NgoModel>? preferredAreaOfImpactNgo;
  List<NgoModel>? followingNgo;
  String? city;
  String? state;
  List<CommunityModel>? communities;
  String? description;
}