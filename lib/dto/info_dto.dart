class InfoDto{
  String? stateName;
  String? stateInitials;
  String? twitter;


  InfoDto({
    this.stateName = "",
    this.stateInitials = "",
    this.twitter = ""
  });

  Map<String,dynamic> toMap(){
    return {
      "stateName": stateName,
      "stateInitials": stateInitials,
      "twitter": twitter,
    };
  }

  @override
  String toString(){
    return 'InfoDto{stateName: $stateName, "twitter": $twitter, "stateInitials" : $stateInitials}';
  }

  factory InfoDto.fromJson(Map<String, dynamic> json) => InfoDto(
    stateName: json["name"].toString(),
    stateInitials: json["state"].toString(),
    twitter: json["twitter"].toString(),
  );

}