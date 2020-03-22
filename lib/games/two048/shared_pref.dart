class SharedPreferences {
  static SharedPreferences sharedPreferences;
  Map<String, dynamic> dataMap = {};

  int getInt(String s) {
    return dataMap[s];
  }

  void setInt(String s, int score) {
    dataMap[s] = score;
  }

  static getInstance() {
    if (sharedPreferences == null) sharedPreferences = SharedPreferences();
    return sharedPreferences;
  }
}
