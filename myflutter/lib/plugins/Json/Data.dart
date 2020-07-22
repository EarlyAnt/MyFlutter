class Friend {
  String child_sn;
  String child_name;
  String cup_sn;
  int game_level;
  int game_crown_count;
  int game_bronze_crown;
  int game_silver_crown;
  int game_golden_crown;
  String area;
  int sort_index;
  String cup_game_name;
  int child_head_index;

  Friend(
      {this.child_sn,
      this.child_name,
      this.cup_sn,
      this.game_level,
      this.game_crown_count,
      this.game_bronze_crown,
      this.game_silver_crown,
      this.game_golden_crown,
      this.area,
      this.sort_index,
      this.cup_game_name,
      this.child_head_index});

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
        child_sn: json['child_sn'],
        child_name: json['child_name'],
        cup_sn: json['cup_sn'],
        game_level: json['game_level'],
        game_crown_count: json['game_crown_count'],
        game_bronze_crown: json['game_bronze_crown'],
        game_silver_crown: json['game_silver_crown'],
        game_golden_crown: json['game_golden_crown'],
        area: json['area'],
        sort_index: json['sort_index'],
        cup_game_name: json['cup_game_name'],
        child_head_index: json['child_head_index']);
  }
}
