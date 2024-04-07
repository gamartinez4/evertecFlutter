class CurrentDto{
  String stateInitials;
  String totalCases;
  String lastModification;
  String deathConfirmed;
  String positive;
  String negative;

 CurrentDto({
    this.stateInitials = "",
    this.totalCases = "",
    this.lastModification = "",
    this.deathConfirmed = "",
    this.positive = "",
    this.negative = "",
  });

  Map<String,dynamic> toMap(){
    return {
      "stateInitials": stateInitials,
      "totalCases": totalCases,
      "lastModification" : lastModification,
      "deathConfirmed" : deathConfirmed,
      "positive" : positive,
      "negative" : negative,
    };
  }

  @override
  String toString(){
    return 'CurrentDto{id: $stateInitials, totalCases: $totalCases, lastModification: $lastModification, deathConfirmed: $deathConfirmed, "positive": $positive, "negative" : $negative}';
  }

  factory CurrentDto.fromJson(Map<String, dynamic> json) => CurrentDto(
    stateInitials: json["state"],
    totalCases:  json["totalCases"],
    lastModification: json["dateModified"],
    deathConfirmed: json["deathConfirmed"],
    positive: json["positive"],
    negative: json["negative"],
  );
 
}