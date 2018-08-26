class Rating {
  int _max;
  dynamic _average;
  String _stars;
  int _min;

  Rating({int max, dynamic average, String stars, int min}) {
    this._max = max;
    this._average = average;
    this._stars = stars;
    this._min = min;
  }

  int get max => _max;

  set max(int max) => _max = max;

  dynamic get average => _average;

  set average(dynamic average) => _average = average;

  String get stars => _stars;

  set stars(String stars) => _stars = stars;

  int get min => _min;

  set min(int min) => _min = min;

  Rating.fromJson(Map<String, dynamic> json) {
    _max = json['max'];
    _average = json['average'];
    _stars = json['stars'];
    _min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this._max;
    data['average'] = this._average;
    data['stars'] = this._stars;
    data['min'] = this._min;
    return data;
  }
}
