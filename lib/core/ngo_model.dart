import 'package:ngo_hackathon/core/community_model.dart';
import 'package:ngo_hackathon/core/news_model.dart';

class NgoModel {
  String? name;
  String? description;
  String? profilePhoto;
  List<String>? photos;
  List<String>? fieldsOfImpact;
  List<String>? previousString;
  List<List<String>>?
      currentGoals; //first element is the goal and the next is the method of achieving it
  String? impactOnEnvironment;
  int? followerCount;
  int? fundingNeeds;
  String? city;
  String? state;
  List<String>? phoneNumbers;
  List<String>? emails;
  CommunityModel? community;
  List<News>? news;
}


