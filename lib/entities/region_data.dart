class RegionData {
  String stateName;
  String totalCases;
  String lastModification;
  String deathConfirmed;
  String positive;
  String negative;
  String twitter;

  RegionData({
    this.stateName = "",
    this.totalCases = "",
    this.lastModification = "",
    this.deathConfirmed = "",
    this.positive = "",
    this.negative = "",
    this.twitter = ""
  });

  Map<String,dynamic> toMap(){
    return {
      "stateName": stateName,
      "totalCases": totalCases,
      "lastModification" : lastModification,
      "deathConfirmed" : deathConfirmed,
      "positive" : positive,
      "negative" : negative,
      "twitter": twitter
    };
  }

  @override
  String toString(){
    return 'RegionData{id: $stateName, totalCases: $totalCases, lastModification: $lastModification, deathConfirmed: $deathConfirmed, "positive": $positive, "negative" : $negative, "twitter": $twitter}';
  }

  factory RegionData.fromJson(Map<String, dynamic> json) => RegionData(
    stateName: json["stateName"],
    totalCases:  json["totalCases"],
    lastModification: json["lastModification"],
    deathConfirmed: json["deathConfirmed"],
    positive: json["positive"],
    negative: json["negative"],
    twitter: json["twitter"]
  );

}
