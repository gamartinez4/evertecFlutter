class CountryData {
  String negative;
  String totalTestResults;
  String pending;
  String death;
  String positive;
  String recovered;

  CountryData({
    this.negative = 'No data',
    this.totalTestResults = 'No data',
    this.pending = 'No data',
    this.death = 'No data',
    this.positive = 'No data',
    this.recovered = 'No data',
  });

  Map<String,dynamic> toMap(){
    return {
      "stateName": negative,
      "totalCases": totalTestResults,
      "lastModification" : pending,
      "deathConfirmed" : death,
      "positive" : positive,
      "recovered" : recovered
    };
  }

  @override
  String toString(){
    return 'CountryData{id: $negative, totalCases: $totalTestResults, lastModification: $pending, deathConfirmed: $death, positive: $positive, recovered: $recovered}';
  }

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      negative: json["negative"].toString(),
      totalTestResults: json["totalTestResults"].toString(),
      pending: json["pending"].toString(),
      death: json["death"].toString(),
      positive: json["positive"].toString(),
      recovered: json["recovered"]?.toString() ?? 'No data',
    );
  }

}
