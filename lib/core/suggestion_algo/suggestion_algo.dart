import 'package:ngo_hackathon/core/models/ngo_model.dart';
import 'package:ngo_hackathon/core/models/philanthropist_model.dart';

List<NgoModel> matchBasedOnFieldOfImpact(
    PhilanthropistModel philanthropist, List<NgoModel> ngoList) {
  Map<NgoModel, int> matchesMap = {};
  for (var ngo in ngoList) {
    int matches = 0;
    for (var field in ngo.fieldsOfImpact!) {
      if (philanthropist.preferredAreaofimpact!.contains(field)) {
        matches++;
      }
    }
    matchesMap[ngo] = matches;
  }
  Map.fromEntries(matchesMap.entries.toList()
    ..sort((e1, e2) => e1.value.compareTo(e2.value)));
    
  return matchesMap.keys.toList();
}

List<NgoModel> suggestionAlgorithm(
    PhilanthropistModel philanthropist, List<NgoModel> ngoList) {
  List<NgoModel> ngoPreference = [];

  List<NgoModel> sameStateAndCity = ngoList
      .where((ngo) =>
          ngo.city == philanthropist.city && ngo.state == philanthropist.state)
      .toList();
  List<NgoModel> diffStateSameCity = ngoList
      .where((ngo) =>
          ngo.city == philanthropist.city && ngo.state != philanthropist.state)
      .toList();
  List<NgoModel> outside = ngoList
      .where((ngo) =>
          ngo.city != philanthropist.city && ngo.state != philanthropist.state)
      .toList();

  ngoPreference
      .addAll(matchBasedOnFieldOfImpact(philanthropist, sameStateAndCity));
  ngoPreference
      .addAll(matchBasedOnFieldOfImpact(philanthropist, diffStateSameCity));
  ngoPreference.addAll(matchBasedOnFieldOfImpact(philanthropist, outside));

  return ngoPreference;
}
