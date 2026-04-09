class SeriesCalculate {
  int readingTime;
  int series;

  int get readingTimeLevel {
    if (readingTime < 30) {
      return 1;
    } else if (readingTime < 60) {
      return 2;
    } else if (readingTime < 90) {
      return 3;
    } else if (readingTime < 120) {
      return 4;
    } else {
      return 5;
    }
  }

  int get seriesLevel {
    if (series < 3) {
      return 1;
    } else if (series < 7) {
      return 2;
    } else if (series < 30) {
      return 3;
    } else if (series < 100) {
      return 4;
    } else {
      return 5;
    }
  }

  SeriesCalculate({required this.readingTime, required this.series});
}
