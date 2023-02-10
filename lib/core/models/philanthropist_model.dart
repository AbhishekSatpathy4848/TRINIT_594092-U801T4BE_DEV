import 'package:ngo_hackathon/core/models/community_model.dart';
import 'package:ngo_hackathon/core/models/ngo_model.dart';

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