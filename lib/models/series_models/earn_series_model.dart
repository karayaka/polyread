class EarnSeriesModel {
  bool isTimeEarned = false;
  bool isStreakEarned = false;
  int timeLevel;
  int streakLevel;

  EarnSeriesModel({
    this.isTimeEarned = false,
    this.isStreakEarned = false,
    this.timeLevel = 1,
    this.streakLevel = 1,
  });
}
